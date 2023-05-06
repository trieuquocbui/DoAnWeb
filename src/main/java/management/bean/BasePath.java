package management.bean;

public class BasePath {
	static String pathImgCustomer;
	static String pathImgStaff;
	static String pathImgProduct;
	
	
	
	public BasePath() {
		//Đường dẫn link lưu ảnh trong máy 
		pathImgCustomer = "C:\\Users\\xuan\\"
				+ "git\\DoAnWeb\\src\\main\\webapp\\templates\\user\\assets\\image\\";
	}
	
	public String getPathImgCustomer() {
		return pathImgCustomer;
	}

	public String getPathImgStaff() {
		return pathImgStaff;
	}

	public String getPathImgProduct() {
		return pathImgProduct;
	}

	
	
}
