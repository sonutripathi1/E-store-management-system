<%!
	public class CartData{

	String name,code,company;
	int quantity,price;
	
	public void setData(String cd,String nm,String com,int pri,int qau){
		code = cd;
		name = nm;
		company = com;
		quantity = qau;
		price = pri;
	}
	
	public void setQuantity(int qau){
		quantity = qau;
	}
	
	String getCode(){
		return code;
	}
	
	String getName(){
		return name;
	}
	
	String getCompany(){
		return company;
	}
	
	int getQuantity(){
		return quantity;
	}
	
	int getPrice(){
		return price;
	}
}
%>
