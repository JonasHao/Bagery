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
    private int pricedpro_id;
    private int user_id;
    private int page_num;
	private String title;
    private String description;
	private double unit_price;
	private double sale_price;
	private String color;
    private int stock;
    private String word;
    private Priced priced;
    private Product product;
    private User user;
    private PricedPro pricedPro;
	private List<Product> products;
	private List<Priced> priceds;
    private List<Property> pros;
    private List<Property> pros1;
    private List<Property> pros2;
    private List<Property> pros3;
    private List<Integer> proIDs;
    private List<Integer> proIDs1;
    private List<Integer> proIDs2;
    private List<Integer> proIDs3;
    private List<UserPricedRecord> records;
    private List<Comment> comments;
	private ProductService productService;
    private UserService userService;
    private CommentService commentService;

    /*
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
	*/
    public String add() {
        try {
            priced = new Priced();
            priced.setTitle(title);
            priced.setDescription(description);
            priced.setUnitPrice(unit_price);
            priced.setSalePrice(sale_price);
            System.out.println(priced);
            productService.addPriced(priced);
            priced_id = priced.getPricedId();
            System.out.printf("count of products:%d\n", products.size());
            for (Product product : products) {
                if (product.getColor() == null) {
                    continue;
                }
                product.setPricedId(priced_id);
                System.out.println(product);
                productService.addProduct(product);
            }
            for (Integer proID : proIDs) {
                pricedPro = new PricedPro();
                pricedPro.setPricedId(priced_id);
                pricedPro.setProId(proID);
                productService.addPricedPro(pricedPro);
            }
            return SUCCESS;
        } catch (HibernateException e) {
            e.printStackTrace();
            return ERROR;
        }
    }
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
    /*
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
    */
    public String update() {
        try {
            priced = productService.findPriced(priced_id);
            priced.setTitle(title);
            priced.setDescription(description);
            priced.setUnitPrice(unit_price);
            priced.setSalePrice(sale_price);
            productService.updatePriced(priced);

            for (Product product : products) {
                product=new Product();
                product.setPricedId(priced_id);
                product.setColor(color);
                product.setStock(stock);
                productService.addProduct(product);
            }
            for (Property property : pros) {
                pricedPro = productService.findPricedPro(pricedpro_id);
                pricedPro.setProId(property.getProId());
                productService.updatePricedPro(pricedPro);
            }
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
            pros1=productService.findProsByCategory("品牌");
            pros2=productService.findProsByCategory("材质");
            pros3=productService.findProsByCategory("款式");
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
            priceds=productService.findPricedsByProperty(proIDs1,proIDs2,proIDs3);
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

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public PricedPro getPricedpro() {
        return pricedPro;
    }

    public void setPricedpro(PricedPro pricedpro) {
        this.pricedPro = pricedpro;
    }

    public int getPricedpro_id() {
        return pricedpro_id;
    }

    public void setPricedpro_id(int pricedpro_id) {
        this.pricedpro_id = pricedpro_id;
    }

    public PricedPro getPricedPro() {
        return pricedPro;
    }

    public void setPricedPro(PricedPro pricedPro) {
        this.pricedPro = pricedPro;
    }
    public List<Property> getPros1() {
        return pros1;
    }

    public void setPros1(List<Property> pros1) {
        this.pros1 = pros1;
    }

    public List<Property> getPros2() {
        return pros2;
    }

    public void setPros2(List<Property> pros2) {
        this.pros2 = pros2;
    }

    public List<Property> getPros3() {
        return pros3;
    }

    public void setPros3(List<Property> pros3) {
        this.pros3 = pros3;
    }
    public List<Property> getPros() {
        return pros;
    }

    public void setPros(List<Property> pros) {
        this.pros = pros;
    }
    public List<Integer> getProIDs1() {
        return proIDs1;
    }

    public void setProIDs1(List<Integer> proIDs1) {
        this.proIDs1 = proIDs1;
    }

    public List<Integer> getProIDs2() {
        return proIDs2;
    }

    public void setProIDs2(List<Integer> proIDs2) {
        this.proIDs2 = proIDs2;
    }

    public List<Integer> getProIDs3() {
        return proIDs3;
    }

    public void setProIDs3(List<Integer> proIDs3) {
        this.proIDs3 = proIDs3;
    }
    public void setUnit_price(double unit_price) {
        this.unit_price = unit_price;
    }

    public void setSale_price(double sale_price) {
        this.sale_price = sale_price;
    }
    public double getUnit_price() {
        return unit_price;
    }

    public double getSale_price() {
        return sale_price;
    }

    public List<Integer> getProIDs() {
        return proIDs;
    }

    public void setProIDs(List<Integer> proIDs) {
        this.proIDs = proIDs;
    }
    public int getPage_num() {
        return page_num;
    }

    public void setPage_num(int page_num) {
        this.page_num = page_num;
    }
}