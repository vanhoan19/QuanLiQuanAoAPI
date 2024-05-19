# Kết nối và truy vấn đến CSDL
from flask import flash, Flask, jsonify, url_for, redirect, session, request
from datetime import datetime
import pyodbc
import flask

from config import connect_str

try:
    conn = pyodbc.connect(connect_str)
    cursor = conn.cursor()
    # method: GET : select, POST : insert, PUT: update
    app = flask.Flask(__name__)
    app.secret_key = 'vanhoan19703'

    # ------------- Đăng nhập, đăng xuất -------------------- #
    @app.post('/login')
    def login():
        # Kiểm tra tài khoản có hợp lệ không?
        user_name = request.form["UserName"]
        pass_word = request.form["passWord"]
        # print(user_name, pass_word)
        data = (user_name, pass_word)
        sql = "select MaNV, TenNV, Role from tNhanVien where UserName = ? and passWord = ?"
        cursor.execute(sql, data)
        nhanVien = cursor.fetchone()
        if nhanVien:
            # Lưu thông tin đăng nhập vào phiên
            keys = [key[0] for key in cursor.description]
            result = dict(zip(keys, nhanVien))
            res = jsonify(result)
            res.status_code = 200
            return res
        else:
            res = jsonify({"mess": "error"})
            res.status_code = 500
            return res
        
    # ------------- Products ----------------------
    @app.route('/products', methods = ['GET'])
    def getAllMatHang():
        print(session.get("logged_in"))
        sql = "exec proc_get_all_mat_hang"
        cursor.execute(sql) # thực thi
        result = [] # chứa kết quả trả về
        keys = [key[0] for key in cursor.description] # lưu các key trong bảng select
        for i in cursor.description:
            keys.append(i[0]) # lấy key
        for i in cursor.fetchall():
            result.append(dict(zip(keys, i))) 
        resp = flask.jsonify(result)
        resp.status = 200
        return resp
    
    # ---------------- Customer ------------------
    # --------- lấy danh sách tất cả các khách hàng
    @app.route('/customers', methods = ['GET'])
    def getAllCustomers():
        sql = "select MaKH, TenKH, SDT, DiaChi, MaNV from tKhachHang"
        cursor.execute(sql) # thực thi
        result = [] # chứa kết quả trả về
        keys = [key[0] for key in cursor.description] # lưu các key trong bảng select
        for i in cursor.fetchall():
            result.append(dict(zip(keys, i))) 
        resp = jsonify(result)
        resp.status = 200
        return resp
    
    # --------- lấy khách hàng theo id ------------
    @app.get('/customers/<int:id>')
    def getCustomerById(id):
        sql = "select MaKH, TenKH, SDT, DiaChi from tKhachHang where MaKH = ?"
        cursor.execute(sql, id) # thực thi
        keys = [key[0] for key in cursor.description] # lưu các key trong bảng select
        result = dict(zip(keys, cursor.fetchone()))
        resp = jsonify(result)
        resp.status = 200
        return resp

    # --------- thêm mới khách hàng ---------------
    @app.post("/customers")
    def insertCustomer():
        try:
            TenKH = flask.request.json.get("TenKH")
            SDT = flask.request.json.get("SDT")
            DiaChi = flask.request.json.get("DiaChi")
            MaNV = flask.request.json.get("MaNV")
            print(TenKH, SDT, DiaChi, MaNV)
            sql = "insert into tKhachHang(TenKH, SDT, DiaChi, MaNV, createdAt) values(?, ?, ?, ?, CURRENT_TIMESTAMP)"
            data = (TenKH, SDT, DiaChi, MaNV)
            cursor.execute(sql, data)
            conn.commit()
            res = flask.jsonify({"mess": "inserted"})
            res.status_code = 200
            return res
        except Exception as e:
            # Trả về thông báo lỗi nếu có lỗi xảy ra
            res = flask.jsonify({"mess": "error"})
            res.status_code = 500
            return res
    
    # --------- sửa thông tin khách hàng ----------
    @app.put("/customers")
    def updateCustomer():
        try:
            TenKH = flask.request.json.get("TenKH")
            SDT = flask.request.json.get("SDT")
            DiaChi = flask.request.json.get("DiaChi")
            MaKH = flask.request.json.get("MaKH")
            sql = "update tKhachHang set TenKH = ?, SDT = ?, DiaChi = ? where MaKH = ?"
            data = (TenKH, SDT, DiaChi, MaKH)
            cursor.execute(sql, data)
            conn.commit()
            res = flask.jsonify({"mess": "updated"})
            res.status_code = 200
            return res
        except Exception as e:
            # Trả về thông báo lỗi nếu có lỗi xảy ra
            res = flask.jsonify({"mess": "error"})
            res.status_code = 500
            return res
    
    # -------------- Hóa đơn ---------------------
    # ---------- Lấy thông tin các hóa đơn mà khách hàng đã mua -------------
    @app.get('/invoices/<int:customerID>')
    def getAllInvoices(customerID):
        sql = "select MaHDB, MaNV, MaKH, TongTien, GiamGia, ThanhToan, PhuongThucTT, createdAt from tHoaDonBan where MaKH = ? order by createdAt DESC"
        cursor.execute(sql, customerID) # thực thi
        result = [] # chứa kết quả trả về
        keys = [key[0] for key in cursor.description] # lưu các key trong bảng select
        for i in cursor.fetchall():
            result.append(dict(zip(keys, i))) 
        resp = jsonify(result)
        resp.status = 200
        return resp
    
    # --------------- Lấy tông tiền mà khách hàng đã mua -------------
    @app.get("/invoices/getSum/<int:customerID>")
    def getSumByCustomerID(customerID):
        sql = "select ISNULL(SUM(TongTien), 0) from tHoaDonBan where MaKH = ?"
        cursor.execute(sql, customerID) # thực thi
        result = cursor.fetchone()[0]
        return jsonify(result), 200
    
    # ---------- Lấy thông tin các chi tiết hóa đơn -------------
    @app.get('/invoiceDetails/<MaHDB>')
    def getAllInvoiceDetails(MaHDB):
        sql = "select MaHDB, MaMH, SLBan from tChiTietHDB where MaHDB = ?"
        cursor.execute(sql, MaHDB) # thực thi
        result = [] # chứa kết quả trả về
        keys = [key[0] for key in cursor.description] # lưu các key trong bảng select
        for i in cursor.fetchall():
            result.append(dict(zip(keys, i))) 
        resp = jsonify(result)
        resp.status = 200
        return resp

    # ---------- Thêm mới hóa đơn --------------
    @app.post("/invoices")
    def insertInvoice():
        try:
            sql = "insert into tHoaDonBan(MaHDB, MaNV, MaKH, TongTien, GiamGia, ThanhToan, PhuongThucTT, createdAt) values(?, ?, ?, ?, ?, ?, ?, ?)"
            MaHDB = flask.request.json.get("MaHDB")
            MaNV = flask.request.json.get("MaNV")
            MaKH = flask.request.json.get("MaKH")
            TongTien = flask.request.json.get("TongTien")
            GiamGia = flask.request.json.get("GiamGia", 0)
            ThanhToan = flask.request.json.get("ThanhToan", TongTien)
            PhuongThucTT = flask.request.json.get("PhuongThucTT", False)
            createdAt = flask.request.json.get("createdAt")
            data = (MaHDB, MaNV, MaKH, TongTien, GiamGia, ThanhToan, PhuongThucTT, createdAt)
            cursor.execute(sql, data)
            conn.commit()
            res = flask.jsonify({"mess": "inserted"})
            res.status_code = 200
            return res
        except Exception as e:
            # Trả về thông báo lỗi nếu có lỗi xảy ra
            res = flask.jsonify({"mess": "error"})
            res.status_code = 500
            return res
        
    @app.post("/invoiceDetails")
    def insertInvoiceDetail():
        invoiceDetails = flask.request.get_json()
        for invoiceDetail in invoiceDetails:
            sql = "insert into tChiTietHDB(MaHDB, MaMH, SLBan) values(?, ?, ?)"
            MaHDB = invoiceDetail.get("MaHDB")
            MaMH = invoiceDetail.get("MaMH")
            SLBan = invoiceDetail.get("SLBan")
            data = (MaHDB, MaMH, SLBan)
            cursor.execute(sql, data)
            sqlUpdate = "update tMatHang set SLTon = SLTon - ? where MaMH = ?"
            data = (SLBan, MaMH)
            cursor.execute(sqlUpdate, data)
        conn.commit()
        res = flask.jsonify({"mess":"thành công"})
        res.status_code = 200
        return res

    # -------------- Nhân viên --------
    @app.get("/employees")
    def getAllEmployees():
        sql = "select MaNV, TenNV, Role from tNhanVien"
        cursor.execute(sql) # thực thi
        result = [] # chứa kết quả trả về
        keys = [key[0] for key in cursor.description] # lưu các key trong bảng select
        for i in cursor.fetchall():
            result.append(dict(zip(keys, i))) 
        resp = jsonify(result)
        resp.status = 200
        return resp
    
    # --------- lấy nhân viên theo id ------------
    @app.get('/employees/<int:id>')
    def getEmployeeById(id):
        sql = "select MaNV, TenNV, Role from tNhanVien where MaNV = ?"
        cursor.execute(sql, id) # thực thi
        keys = [key[0] for key in cursor.description] # lưu các key trong bảng select
        result = dict(zip(keys, cursor.fetchone()))
        resp = jsonify(result)
        resp.status = 200
        return resp
    if __name__ == "__main__":
    #   app.run(debug=True)             
      app.debug = True              # Dùng để chạy debug với Web
      app.run(host = "192.168.1.13", port = 1919)  
except Exception as e:
    print(e)