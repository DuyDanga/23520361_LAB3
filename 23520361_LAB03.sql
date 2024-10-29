
-- 8. Hiển thị tên và cấp độ của tất cả các kỹ năng của chuyên gia có MaChuyenGia là 1.
SELECT KyNang.TenKyNang, ChuyenGia_KyNang.CapDo
FROM KyNang
JOIN ChuyenGia_KyNang ON KyNang.MaKyNang = ChuyenGia_KyNang.MaKyNang
WHERE ChuyenGia_KyNang.MaChuyenGia = 1;

-- 9. Liệt kê tên các chuyên gia tham gia dự án có MaDuAn là 2.
SELECT CHUYENGIA.HoTen
FROM CHUYENGIA
JOIN ChuyenGia_DuAn ON CHUYENGIA.MaChuyenGia = ChuyenGia_DuAn.MaChuyenGia
WHERE ChuyenGia_DuAn.MaDuAn = 2;


-- 10. Hiển thị tên công ty và tên dự án của tất cả các dự án.
SELECT CongTy.TenCongTy, DuAn.TenDuAn
FROM CongTy
RIGHT JOIN DuAn ON CongTy.MaCongTy = DuAn.MaCongTy


-- 11. Đếm số lượng chuyên gia trong mỗi chuyên ngành.
SELECT CHUYENGIA.ChuyenNganh, COUNT(*) AS SLCG
FROM CHUYENGIA
GROUP BY CHUYENGIA.ChuyenNganh

-- 12. Tìm chuyên gia có số năm kinh nghiệm cao nhất.
SELECT TOP 1 CHUYENGIA.HoTen
FROM CHUYENGIA
ORDER BY CHUYENGIA.NamKinhNghiem DESC;

-- 13. Liệt kê tên các chuyên gia và số lượng dự án họ tham gia.
SELECT CHUYENGIA.HoTen, COUNT(ChuyenGia_DuAn.MaDuAn) AS SLDA
FROM CHUYENGIA
LEFT JOIN ChuyenGia_DuAn ON CHUYENGIA.MaChuyenGia = ChuyenGia_DuAn.MaChuyenGia
GROUP BY ChuyenGia.HoTen;

-- 14. Hiển thị tên công ty và số lượng dự án của mỗi công ty.
SELECT CongTy.TenCongTy, COUNT( DuAn.MaDuAn) AS SOLUONGDUAN
FROM CongTy
LEFT JOIN DuAn ON CongTy.MaCongTy = DuAn.MaCongTy
GROUP BY CongTy.TenCongTy;

-- 15. Tìm kỹ năng được sở hữu bởi nhiều chuyên gia nhất.
SELECT TOP 1 ChuyenGia_KyNang.MaKyNang, KyNang.TenKyNang, COUNT( ChuyenGia_KyNang.MaChuyenGia) AS SOLUONGCHUYENGIA
FROM ChuyenGia_KyNang
JOIN KyNang ON KyNang.MaKyNang = ChuyenGia_KyNang.MaKyNang
GROUP BY ChuyenGia_KyNang.MaKyNang, KyNang.TenKyNang
ORDER BY SOLUONGCHUYENGIA DESC;

-- 16. Liệt kê tên các chuyên gia có kỹ năng 'Python' với cấp độ từ 4 trở lên.
SELECT CHUYENGIA.HoTen
FROM CHUYENGIA
JOIN ChuyenGia_KyNang ON CHUYENGIA.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
WHERE ChuyenGia_KyNang.MaKyNang = 2
AND ChuyenGia_KyNang.CapDo > 4;

-- 17. Tìm dự án có nhiều chuyên gia tham gia nhất.
SELECT TOP 1 ChuyenGia_DuAn.MaDuAn, DuAn.TenDuAn, COUNT( ChuyenGia_DuAn.MaChuyenGia) AS SLCG
FROM ChuyenGia_DuAn
JOIN DuAn ON DuAn.MaDuAn = ChuyenGia_DuAn.MaDuAn
GROUP BY ChuyenGia_DuAn.MaDuAn, DuAn.TenDuAn
ORDER BY SLCG DESC;

-- 18. Hiển thị tên và số lượng kỹ năng của mỗi chuyên gia.
SELECT CHUYENGIA.HoTen, COUNT( ChuyenGia_KyNang.MaKyNang) AS SLKN
FROM CHUYENGIA
JOIN ChuyenGia_KyNang ON CHUYENGIA.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
GROUP BY CHUYENGIA.HoTen;

-- 19. Tìm các cặp chuyên gia làm việc cùng dự án.
SELECT 
    cg1.HoTen AS ChuyenGia1,
    cg2.HoTen AS ChuyenGia2,
    du.TenDuAn
FROM 
    ChuyenGia_DuAn cgdu1
JOIN 
    ChuyenGia_DuAn cgdu2 ON cgdu1.MaDuAn = cgdu2.MaDuAn 
    AND cgdu1.MaChuyenGia < cgdu2.MaChuyenGia
JOIN 
    ChuyenGia cg1 ON cgdu1.MaChuyenGia = cg1.MaChuyenGia
JOIN 
    ChuyenGia cg2 ON cgdu2.MaChuyenGia = cg2.MaChuyenGia
JOIN 
    DuAn du ON cgdu1.MaDuAn = du.MaDuAn;

-- 20. Liệt kê tên các chuyên gia và số lượng kỹ năng cấp độ 5 của họ.
SELECT CHUYENGIA.HoTen, COUNT( ChuyenGia_KyNang.CapDo) AS SLKN
FROM CHUYENGIA
JOIN ChuyenGia_KyNang ON CHUYENGIA.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
WHERE ChuyenGia_KyNang.CapDo = 5
GROUP BY CHUYENGIA.HoTen;

-- 21. Tìm các công ty không có dự án nào.
SELECT CongTy.TenCongTy, DuAn.MaDuAn
FROM CongTy
LEFT JOIN DuAn ON DuAn.MaCongTy = CongTy.MaCongTy
WHERE DuAn.MaDuAn = NULL;

-- 22. Hiển thị tên chuyên gia và tên dự án họ tham gia, bao gồm cả chuyên gia không tham gia dự án nào.
SELECT CHUYENGIA.HoTen, DuAn.TenDuAn
FROM DuAn
JOIN ChuyenGia_DuAn ON DuAn.MaDuAn = ChuyenGia_DuAn.MaDuAn
RIGHT JOIN CHUYENGIA ON CHUYENGIA.MaChuyenGia = ChuyenGia_DuAn.MaChuyenGia;

-- 23. Tìm các chuyên gia có ít nhất 3 kỹ năng.
SELECT CHUYENGIA.HoTen, COUNT(ChuyenGia_KyNang.MaKyNang) AS SLKN
FROM CHUYENGIA
JOIN ChuyenGia_KyNang ON CHUYENGIA.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
GROUP BY CHUYENGIA.HoTen
HAVING COUNT( CHUYENGIA_KYNANG.MAKYNANG) >=3;

-- 24. Hiển thị tên công ty và tổng số năm kinh nghiệm của tất cả chuyên gia trong các dự án của công ty đó.
SELECT 
    ct.TenCongTy,
    SUM(cg.NamKinhNghiem) AS TongNamKinhNghiem
FROM 
    CongTy ct
JOIN 
    DuAn da ON ct.MaCongTy = da.MaCongTy
JOIN 
    ChuyenGia_DuAn cgdu ON da.MaDuAn = cgdu.MaDuAn
JOIN 
    ChuyenGia cg ON cgdu.MaChuyenGia = cg.MaChuyenGia
GROUP BY 
    ct.TenCongTy;


-- 25. Tìm các chuyên gia có kỹ năng 'Java' nhưng không có kỹ năng 'Python'.
SELECT cg.*
FROM ChuyenGia cg
JOIN ChuyenGia_KyNang ckk ON cg.MaChuyenGia = ckk.MaChuyenGia
WHERE ckk.MaKyNang = (SELECT MaKyNang FROM KyNang WHERE TenKyNang = 'Java')
AND cg.MaChuyenGia NOT IN (
    SELECT ckk2.MaChuyenGia
    FROM ChuyenGia_KyNang ckk2
    WHERE ckk2.MaKyNang = (SELECT MaKyNang FROM KyNang WHERE TenKyNang = 'Python'));

-- 76. Tìm chuyên gia có số lượng kỹ năng nhiều nhất.
SELECT TOP 1 CHUYENGIA.MaChuyenGia,COUNT( ChuyenGia_KyNang.MaKyNang) AS SLKN
FROM CHUYENGIA
JOIN ChuyenGia_KyNang ON CHUYENGIA.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
GROUP BY CHUYENGIA.MaChuyenGia
ORDER BY SLKN DESC;

-- 77. Liệt kê các cặp chuyên gia có cùng chuyên ngành.
SELECT cg1.HoTen AS HoTen1, cg2.HoTen AS HoTen2, cg1.ChuyenNganh
FROM ChuyenGia cg1
JOIN ChuyenGia cg2 ON cg1.MaChuyenGia < cg2.MaChuyenGia
WHERE cg1.ChuyenNganh = cg2.ChuyenNganh;

-- 78. Tìm công ty có tổng số năm kinh nghiệm của các chuyên gia trong dự án cao nhất.
SELECT TOP 1 ct.TenCongTy, SUM(cg.NamKinhNghiem) AS TongNamKinhNghiem
FROM CongTy ct
JOIN DuAn da ON ct.MaCongTy = da.MaCongTy
JOIN ChuyenGia_DuAn cgd ON da.MaDuAn = cgd.MaDuAn
JOIN ChuyenGia cg ON cgd.MaChuyenGia = cg.MaChuyenGia
GROUP BY ct.MaCongTy, ct.TenCongTy
ORDER BY TongNamKinhNghiem DESC

-- 79. Tìm kỹ năng được sở hữu bởi tất cả các chuyên gia.
SELECT k.TenKyNang
FROM KyNang k
JOIN ChuyenGia_KyNang ckk ON k.MaKyNang = ckk.MaKyNang
GROUP BY k.TenKyNang
HAVING COUNT(DISTINCT ckk.MaChuyenGia) = (SELECT COUNT(*) FROM ChuyenGia);
