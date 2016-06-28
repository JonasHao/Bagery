package action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.hibernate.HibernateException;
import service.ProductService;
import po.*;
import service.*;

public class ProductionAction extends DefaultActionSupport {
	private int product_id;
    private int priced_id;
    private int user_id;
	private String title;
    private String description;
	private int unit_price;
	private int sale_price;
	private String color;
    private int stock;
    private String word;
    private Priced priced;
    private Product product;
    private User user;
	private List<Product> products;
	private List<Priced> priceds;
    private List<Property> pros;
    private List<UserPricedRecord> records;
    private List<Comment> comments;
	private ProductService productService;
    private UserService userService;
    private CommentService commentService;



	public String addPriced()throws Exception
	{
        try {
            priced=new Priced();
            priced.setTitle(title);
            priced.setDescription(description);
            priced.setUnitPrice(unit_price);
            priced.setSalePrice(sale_price);
            productService.addPriced(priced);
            return SUCCESS;
        }catch(HibernateException e){
           e.printStackTrace();
            return ERROR;
       }
	}

	public String addProduct()
	{
 		try {
            product=new Product();
            product.setPricedId(priced_id);
            product.setColor(color);
            product.setStock(stock);
            productService.addProduct(product);
            return SUCCESS;
        }catch(HibernateException e){
           e.printStackTrace();
            return ERROR;
       }
	}
//    public String add()
//    {
//        try {
//            priced=new Priced();
//            priced.setTitle(title);
//            priced.setDescription(description);
//            priced.setUnitPrice(unit_price);
//            priced.setSalePrice(sale_price);
//            productService.addPriced(priced);
//
//            return SUCCESS;
//        }catch(HibernateException e){
//            e.printStackTrace();
//            return ERROR;
//        }
//    }
	public String viewProduct()
	{
		try {
			priced=productService.findPriced(priced_id);
            products=productService.findProductsByPriced(priced_id);
            comments=commentService.getByPricedId(priced_id);
			return SUCCESS;
		}catch(HibernateException e){
           e.printStackTrace();
            return ERROR;
       }
	}

	public String updatePriced()
	{
        try {
            priced=productService.findPriced(priced_id);
            priced.setTitle(title);
            priced.setDescription(description);
            priced.setUnitPrice(unit_price);
            priced.setSalePrice(sale_price);
            productService.updatePriced(priced);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
	}
    public String updateProduct()
    {
        try {
            product=productService.findProduct(product_id);
            product.setColor(color);
            product.setStock(stock);
            productService.updateProduct(product);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    public String deletePriced()
    {
        try {
            productService.deletePriced(priced_id);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
	public String deleteProduct()
	{
        try {
            productService.deleteProduct(product_id);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
	}
    public String soldOutProduct()
    {
        try {
            product=productService.findProduct(product_id);
            product.setStock(0);
            productService.updateProduct(product);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    public String viewPricedList()
    {
        try {
            priceds=productService.findAll();
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    public String viewHistoryRecord()
    {
        try {
            user = userService.getCurrentUser();
            records=productService.findHistoryRecord(user.getUserId());
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    public String findPricedsByWord()
    {
        try {
            priceds=productService.findPricedsByWord(word);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    public String findPricedsByPro()
    {
        try {
            priceds=productService.findPricedsByProperty(pros);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }


    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getPriced_id() {
        return priced_id;
    }

    public void setPriced_id(int priced_id) {
        this.priced_id = priced_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(int unit_price) {
        this.unit_price = unit_price;
    }

    public int getSale_price() {
        return sale_price;
    }

    public void setSale_price(int sale_price) {
        this.sale_price = sale_price;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Priced getPriced() {
        return priced;
    }

    public void setPriced(Priced priced) {
        this.priced = priced;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public List<Priced> getPriceds() {
        return priceds;
    }

    public void setPriceds(List<Priced> priceds) {
        this.priceds = priceds;
    }

    public List<UserPricedRecord> getRecords() {
        return records;
    }

    public void setRecords(List<UserPricedRecord> records) {
        this.records = records;
    }

    public ProductService getProductService() {
        return productService;
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    public List<Property> getPros() {return pros;}

    public void setPros(List<Property> pros) {this.pros = pros;}

    public String getWord() {return word;}

    public void setWord(String word) {this.word = word;}

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public CommentService getCommentService() {
        return commentService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setConmments(List<Comment> conmments) {
        this.comments = conmments;
    }
}