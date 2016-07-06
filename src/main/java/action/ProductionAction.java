package action;

import java.util.*;

import com.opensymphony.xwork2.ActionContext;
import constant.Key;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.hibernate.HibernateException;
import service.ProductService;
import po.*;
import service.*;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.ArrayList;

public class ProductionAction extends DefaultActionSupport {
    private int product_id;
    private int pricedId;
    private int pricedpro_id;
    private int user_id;
    private int pro_id;
    private String title;
    private String description;
    private double unit_price;
    private double sale_price;
    private String color;
    private int page_num;
    private int stock;
    private String word;
    private Priced priced;
    private Product product;
    private String img;
    private User user;
    private PricedPro pricedPro;
    private List<Product> products;
    private List<Priced> priceds;

    private List<Property> pros;
    private List<List<Property>> pross;
    private List<Integer> proIDs;
    private List<List<Integer>> proIDss;

    private List<UserPricedRecord> records;
    private List<Comment> comments;
    private ProductService productService;
    private UserService userService;
    private CommentService commentService;
    private Map<Integer,String> productMap;

    private List<Map<Integer,String>> proNames;


    public String add() {
        try {
            priced=new Priced();
            priced.setTitle(title);
            priced.setDescription(description);
            priced.setImg(img);
            priced.setUnitPrice(unit_price);
            priced.setSalePrice(sale_price);
            priced.setIsExisted(1);
            productService.addPriced(priced);
            pricedId = priced.getPricedId();
            for (Product product : products) {
                if (product.getColor() == null) {
                    continue;
                }
                product.setPricedId(pricedId);
                productService.addProduct(product);
                System.out.println(product);
            }
            for (Integer proID : proIDs) {
                pricedPro = new PricedPro();
                pricedPro.setPricedId(pricedId);
                pricedPro.setProId(proID);
                productService.addPricedPro(pricedPro);
            }

            return SUCCESS;
        } catch (HibernateException e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    public String viewProduct() {
        try {
            priced = productService.findPriced(pricedId);
            products = productService.findProductsByPriced(pricedId);
            comments = commentService.getByPricedId(pricedId);

            user = userService.getCurrentUser();
            productService.addRecord(user.getUserId(),pricedId);
            return SUCCESS;
        } catch (HibernateException e) {
            e.printStackTrace();
            return ERROR;
        }
        catch (NullPointerException e){
            e.printStackTrace();
            return ERROR;
        }
    }
    public String viewProductAdmin() {
        try {
            proNames=productService.getProNames();
            //productMap

            if(pricedId!=0) {
                priced = productService.findPriced(pricedId);
                products = productService.findProductsByPricedAdmin(pricedId);
                proIDs = productService.findProIDsByPriced(pricedId);
            }
            return SUCCESS;
        } catch (HibernateException e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    public String update() {
        try {
            productService.updatePriced(priced);
            pricedId=priced.getPricedId();
            productService.deleteProductsByPriced(pricedId);
            productService.deletePricedProsByPriced(pricedId);
            for (Product product : products) {
                if (product.getColor() == null) {
                    continue;
                }
                product.setPricedId(pricedId);
                productService.addProduct(product);
            }
            for (Integer proID : proIDs) {
                pricedPro = new PricedPro();
                pricedPro.setPricedId(pricedId);
                pricedPro.setProId(proID);
                productService.addPricedPro(pricedPro);
            }
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    public String deletePriced() {
        try {
            productService.deletePriced(pricedId);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    public String putOnPriced()
    {
        try {
            priced = productService.findPriced(pricedId);
            priced.setIsExisted(1);
            productService.updatePriced(priced);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    public String soldOutPriced() {
        try {
            priced = productService.findPriced(pricedId);
            priced.setIsExisted(0);
            productService.updatePriced(priced);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    public String viewPricedList() {
        try {
            priceds = productService.findAll();
            pross=productService.getPross();
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    public String viewPricedListAdmin() {
        try {
            priceds = productService.findAllAdmin();
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    public String viewHistoryRecord() {
        try {
            user = userService.getCurrentUser();
            records = productService.findHistoryRecord(user.getUserId());
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    public String findPricedsByWord() {
        try {
            priceds = productService.findPricedsByWord(word);
            pross=productService.getPross();
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    private void handlePro(List<List<Integer>> proIDss,int category,int pro_id)
    {
        if(proIDss.get(category).indexOf(pro_id)<0)
            proIDss.get(category).add(pro_id);
        else
            proIDss.get(category).remove(proIDss.get(category).indexOf(pro_id));
    }
    public String findPricedsByPro() {
        try {
            if(ActionContext.getContext().getSession().get(Key.PROID)==null) {
                proIDss = new ArrayList<>(3);
                for(int i=0;i<3;i++)
                    proIDss.add(new ArrayList<>());
            }
            else {
                proIDss = (List<List<Integer>>) ActionContext.getContext().getSession().get(Key.PROID);
            }

            String category=productService.getProByProID(pro_id);
            if(category!=null) {
                switch (category) {
                    case "品牌":
                        handlePro(proIDss,0,pro_id);
                        break;
                    case "材质":
                        handlePro(proIDss,1,pro_id);
                        break;
                    case "款式":
                        handlePro(proIDss,2,pro_id);
                        break;
                }
                ActionContext.getContext().getSession().put(Key.PROID,proIDss);
            }
            priceds = productService.findPricedsByProperty(proIDss.get(0), proIDss.get(1),proIDss.get(2));
            pross=productService.getPross();
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

    public int getPricedId() {
        return pricedId;
    }

    public void setPricedId(int pricedId) {
        this.pricedId = pricedId;
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

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

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

    public List<Property> getPros() {
        return pros;
    }

    public void setPros(List<Property> pros) {
        this.pros = pros;
    }

    public List<List<Property>> getPross() {
        return pross;
    }

    public void setPross(List<List<Property>> pross) {
        this.pross = pross;
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

    public Map<Integer, String> getProductMap() {
        return productMap;
    }

    public void setProductMap(Map<Integer, String> productMap) {
        this.productMap = productMap;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public List<Map<Integer,String>> getProNames() {
        return proNames;
    }

    public void setProNames(List<Map<Integer,String>> proNames) {
        this.proNames = proNames;
    }

    public List<List<Integer>> getProIDss() {
        return proIDss;
    }

    public void setProIDss(List<List<Integer>> proIDss) {
        this.proIDss = proIDss;
    }
}