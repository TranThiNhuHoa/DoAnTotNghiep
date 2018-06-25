function search_validate(){
   
   if (document.search_form.school_info.value == "") {
      alert("Hãy nhập Tên trường hoặc Mã trường để thực hiện tìm kiếm!");
      //document.search_form.Name.focus();
      //return false;
   }
   return (true);
}

function atribute_1_1_2_validate(){


	
	var ToanHoc = document.getElementById('ToanHoc');
	if (ToanHoc.value == "") {
		alert("Hãy nhập điểm tổng kết môn Toán Học");
		//location.reload(true);

	}
	if (ToanHoc.value < 0 || ToanHoc.value > 10) {
		alert("Điểm tổng kết môn Toán Học phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(ToanHoc.value) == true) {
		alert("Điểm tổng kết môn Toán Học phải là giá trị số!");
	}



	var NguVan = document.getElementById('NguVan');
	if (NguVan.value == "") {
		alert("Hãy nhập điểm tổng kết môn Ngữ Văn");
	}
	if (NguVan.value < 0 || NguVan.value > 10) {
		alert("Điểm tổng kết môn Ngữ Văn phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(NguVan.value) == true) {
		alert("Điểm tổng kết môn Ngữ Văn phải là giá trị số!");
	}



	var SinhHoc = document.getElementById('SinhHoc');
	if (SinhHoc.value == "") {
		alert("Hãy nhập điểm tổng kết môn Sinh Học");
	}
	if (SinhHoc.value < 0 || SinhHoc.value > 10) {
		alert("Điểm tổng kết môn Sinh Học phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(SinhHoc.value) == true) {
		alert("Điểm tổng kết môn Sinh Học phải là giá trị số!");
	}



	var VatLi = document.getElementById('VatLi');
	if (VatLi.value == "") {
		alert("Hãy nhập điểm tổng kết môn Vật Lí");
	}
	if (VatLi.value < 0 || VatLi.value > 10) {
		alert("Điểm tổng kết môn Vật Lí phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(VatLi.value) == true) {
		alert("Điểm tổng kết môn Vật Lí phải là giá trị số!");
	}



	var HoaHoc = document.getElementById('HoaHoc');
	if (HoaHoc.value == "") {
		alert("Hãy nhập điểm tổng kết môn Hóa Học");
	}
	if (HoaHoc.value < 0 || HoaHoc.value > 10) {
		alert("Điểm tổng kết môn Hóa Học phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(HoaHoc.value) == true) {
		alert("Điểm tổng kết môn Hóa Học phải là giá trị số!");
	}



	var LichSu = document.getElementById('LichSu');
	if (LichSu.value == "") {
		alert("Hãy nhập điểm tổng kết môn Lịch Sử");
	}
	if (LichSu.value < 0 || LichSu.value > 10) {
		alert("Điểm tổng kết môn Lịch Sử phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(LichSu.value) == true) {
		alert("Điểm tổng kết môn Lịch Sử phải là giá trị số!");
	}



	var DiaLy = document.getElementById('DiaLy');
	if (DiaLy.value == "") {
		alert("Hãy nhập điểm tổng kết môn Địa Lý");
	}
	if (DiaLy.value < 0 || DiaLy.value > 10) {
		alert("Điểm tổng kết môn Địa Lý phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(DiaLy.value) == true) {
		alert("Điểm tổng kết môn Địa Lý phải là giá trị số!");
	}



	var NgoaiNgu = document.getElementById('NgoaiNgu');
	if (NgoaiNgu.value == "") {
		alert("Hãy nhập điểm tổng kết môn Ngoại Ngữ");
	}
	if (NgoaiNgu.value < 0 || NgoaiNgu.value > 10) {
		alert("Điểm tổng kết môn Ngoại Ngữ phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(NgoaiNgu.value) == true) {
		alert("Điểm tổng kết môn Ngoại Ngữ phải là giá trị số!");
	}



	var GiaoDucCongDan = document.getElementById('GiaoDucCongDan');
	if (GiaoDucCongDan.value == "") {
		alert("Hãy nhập điểm tổng kết môn GDCD");
	}
	if (GiaoDucCongDan.value < 0 || GiaoDucCongDan.value > 10) {
		alert("Điểm tổng kết môn GDCD phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(GiaoDucCongDan.value) == true) {
		alert("Điểm tổng kết môn GDCD phải là giá trị số!");
	}



	var GiaoDucQuocPhong = document.getElementById('GiaoDucQuocPhong');
	if (GiaoDucQuocPhong.value == "") {
		alert("Hãy nhập điểm tổng kết môn GDQP");
	}
	if (GiaoDucQuocPhong.value < 0 || GiaoDucQuocPhong.value > 10) {
		alert("Điểm tổng kết môn GDQP phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(GiaoDucQuocPhong.value) == true) {
		alert("Điểm tổng kết môn GDQP phải là giá trị số!");
	}



	var TheDuc = document.getElementById('TheDuc');
	if (TheDuc.value == "") {
		alert("Hãy nhập điểm tổng kết môn Thể Dục");
	}
	if (TheDuc.value < 0 || TheDuc.value > 10) {
		alert("Điểm tổng kết môn Thể Dục phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(TheDuc.value) == true) {
		alert("Điểm tổng kết môn Thể Dục phải là giá trị số!");
	}



	var CongNghe = document.getElementById('CongNghe');
	if (CongNghe.value == "") {
		alert("Hãy nhập điểm tổng kết môn Công Nghệ");
	}
	if (CongNghe.value < 0 || CongNghe.value > 10) {
		alert("Điểm tổng kết môn Công Nghệ phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(CongNghe.value) == true) {
		alert("Điểm tổng kết môn Công Nghệ phải là giá trị số!");
	}



	var TinHoc = document.getElementById('TinHoc');
	if (TinHoc.value == "") {
		alert("Hãy nhập điểm tổng kết môn Tin Học");
	}
	if (TinHoc.value < 0 || TinHoc.value > 10) {
		alert("Điểm tổng kết môn Tin Học phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(TinHoc.value) == true) {
		alert("Điểm tổng kết môn Tin Học phải là giá trị số!");
	}



	var MonTuChon = document.getElementById('MonTuChon');
	if (MonTuChon.value == "") {
		alert("Hãy nhập điểm tổng kết Môn Tự Chọn");
	}
	if (MonTuChon.value < 0 || MonTuChon.value > 10) {
		alert("Điểm tổng kết Môn Tự Chọn phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(MonTuChon.value) == true) {
		alert("Điểm tổng kết Môn Tự Chọn phải là giá trị số!");
	}



	var DiemUuTien_1 = document.getElementById('DiemUuTien_1');
	if (DiemUuTien_1.value == "") {
		alert("Hãy nhập Điểm Ưu Tiên");
	}
	if (DiemUuTien_1.value < 0) {
		alert("Điểm Ưu Tiên nhỏ nhất là 0");
	}
	if (isNaN(DiemUuTien_1.value) == true) {
		alert("Điểm Ưu Tiên phải là giá trị số!");
	}

}

function suggest_1_result_validate(){
	var Suggest_1_result = document.getElementById('suggest_1_result');
	if (Suggest_1_result.value == "") {
		alert("Hãy nhập Mã Ngành hoặc Mã Nhóm ngành đã chọn!");
	}
}

function test_point_validate(){



	var Point_1 = document.getElementById('point_1');
	if (Point_1.value == "") {
		alert("Hãy nhập điểm thi môn thi 1");
	}
	if (Point_1.value < 0 || Point_1.value > 10) {
		alert("Điểm thi môn thi 1 phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(Point_1.value) == true) {
		alert("Điểm thi môn thi 1 phải là giá trị số!");
	}



	var Point_2 = document.getElementById('point_2');
	if (Point_2.value == "") {
		alert("Hãy nhập điểm thi môn thi 2");
	}
	if (Point_2.value < 0 || Point_2.value > 10) {
		alert("Điểm thi môn thi 2 phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(Point_2.value) == true) {
		alert("Điểm thi môn thi 2 phải là giá trị số!");
	}



	var Point_3 = document.getElementById('point_3');
	if (Point_3.value == "") {
		alert("Hãy nhập điểm thi môn thi 3");
	}
	if (Point_3.value < 0 || Point_2.value > 10) {
		alert("Điểm thi môn thi 3 phải trong khoảng từ 0 đến 10.");
	}
	if (isNaN(Point_3.value) == true) {
		alert("Điểm thi môn thi 3 phải là giá trị số!");
	}



	var DiemUuTien_2 = document.getElementById('DiemUuTien_2');
	if (DiemUuTien_2.value == "") {
		alert("Hãy nhập Điểm Ưu Tiên");
	}
	if (DiemUuTien_2.value < 0) {
		alert("Điểm Ưu Tiên nhỏ nhất là 0");
	}
	if (isNaN(DiemUuTien_2.value) == true) {
		alert("Điểm Ưu Tiên phải là giá trị số!");
	}
}

function home_address_validate(){
	var Home_address = document.getElementById('home_address_box');
	if (Home_address.value == "") {
		alert("Hãy nhập địa chỉ thường trú!");
	}
}

function locdau(){
	//code by Minit - www.canthoit.info - 13-05-2009
	var str = (document.getElementById("title").value);
	str= str.toLowerCase();
	str= str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g,"a");
	str= str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g,"e");
	str= str.replace(/ì|í|ị|ỉ|ĩ/g,"i");
	str= str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g,"o");
	str= str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g,"u");
	str= str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g,"y");
	str= str.replace(/đ/g,"d");
	str= str.replace(/!|@|\$|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\'| |\"|\&|\#|\[|\]|~/g,"-");
	str= str.replace(/-+-/g,"-"); //thay thế 2- thành 1-
	str= str.replace(/^\-+|\-+$/g,"");//cắt bỏ ký tự - ở đầu và cuối chuỗi
	return alert("Kết Quả: "+ str);
}
