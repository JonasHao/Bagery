package action;

import java.util.*;

import com.opensymphony.xwork2.ActionContext;
import constant.Key;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.hibernate.HibernateException;
import service.ProductService;
import po.*;
import service.*;

import java.util.ArrayList;


public class ProductionAction extends DefaultActionSupport {
    private int product_id;
    private int pricedId;
    private int pricedpro_id;
    private int user_id;
    private int pro_id;
    private int stock;
    private int isFavor;
    private double unit_price;
    private double sale_price;
    private String title;
    private String description;
    private String color;
    private String word;
    private String img;
    private Priced priced;
    private Product product;
    private PricedPro pricedPro;
    private User user;
    private List<Integer> proIDs;
    private List<Product> products;
    private List<Priced> priceds;
    private List<PricedPro> pricedpros;
    private List<UserPricedRecord> records;
    private List<Comment> comments;
    private List<Property> pros1;
    private List<Property> pros2;
    private List<Property> pros3;
    private List<List<Property>> pross;
    private List<List<Integer>> proIDss;
    private ProductService productService;
    private UserService userService;
    private CommentService commentService;
    private FavoriteService favoriteService;
    //private Map<String, String> productMap;

    public String add() {
        try {
            priced = new Priced();
            priced.setTitle(title.trim());
            priced.setDescription(description.trim());
            priced.setImg(img.trim());
            priced.setUnitPrice(unit_price);
            priced.setSalePrice(sale_price);
            priced.setIsExisted(1);
            productService.addPriced(priced);
            pricedId = priced.getPricedId();
            for (Product product : products) {
                if (product.getColor().trim().length() < 1 || product.getStock() < 0) {
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
        } catch (HibernateException e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    public String viewProduct() {
        try {
            priced = productService.findPriced(pricedId);
            if (priced != null) {
                products = productService.findProductsByPriced(pricedId);
                comments = commentService.getByPricedId(pricedId);

                user = userService.getCurrentUser();
                if (user != null) {
                    productService.addRecord(user.getUserId(), pricedId);
                    isFavor = favoriteService.isFavor(pricedId);
                }
                return SUCCESS;
            }
            return ERROR;
        } catch (HibernateException e) {
            e.printStackTrace();
            return ERROR;
        } catch (NullPointerException e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    public String viewProductAdmin() {
        try {
            priced = productService.findPriced(pricedId);
            if (priced != null) {
                products = productService.findProductsByPricedAdmin(pricedId);
                proIDs = productService.findProIDsByPriced(pricedId);
                return SUCCESS;
            }
            return ERROR;
        } catch (HibernateException e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    public String update() {
        try {
            Priced p = productService.findPriced(pricedId);
            if (p != null) {
                p.setTitle(priced.getTitle().trim());
                p.setDescription(priced.getDescription().trim());
                p.setImg(priced.getImg().trim());
                p.setUnitPrice(priced.getUnitPrice());
                p.setSalePrice(priced.getSalePrice());
                productService.updatePriced(p);

                //更新具体商品
                List<Product> ps = productService.deleteProductsByPriced(pricedId);
                try {
                    for (Product product : products) {
                        if (product.getColor().trim().length() < 1 || product.getStock() < 0) {
                            continue;
                        }
                        product.setPricedId(pricedId);
                        productService.addProduct(product);
                    }
                } catch (Exception e) {
                    for (Product product : ps)
                        productService.addProduct(product);
                    e.printStackTrace();
                    return ERROR;
                }

                //更新属性
                pricedpros = productService.findPricedProByPriced(pricedId);
                if (pricedpros.size() == 3)
                    for (int i = 0; i < 3; i++) {
                        pricedpros.get(i).setProId(proIDs.get(i));
                        productService.updatePricedPro(pricedpros.get(i));
                    }
                else {
                    for (Integer proID : proIDs) {
                        pricedPro = new PricedPro();
                        pricedPro.setPricedId(pricedId);
                        pricedPro.setProId(proID);
                        productService.addPricedPro(pricedPro);
                    }
                }
                return SUCCESS;
            }
            return ERROR;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    public String deletePriced() {
        try {
            if (productService.findPriced(pricedId) != null) {
                productService.deletePriced(pricedId);
                return SUCCESS;
            }
            return ERROR;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    public String putOnPriced() {
        try {
            if (productService.findPriced(pricedId) != null) {
                priced = productService.findPriced(pricedId);
                priced.setIsExisted(1);
                productService.updatePriced(priced);
                return SUCCESS;
            }
            return ERROR;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    public String soldOutPriced() {
        try {
            if (productService.findPriced(pricedId) != null) {
                priced = productService.findPriced(pricedId);
                priced.setIsExisted(0);
                productService.updatePriced(priced);
                return SUCCESS;
            }
            return ERROR;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    public String viewPricedList() {
        try {
            priceds = productService.findAll();
            pross = productService.getPross();
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
            if (user != null)
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
            pross = productService.getPross();
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    private void handlePro(List<List<Integer>> proIDss, int category, int pro_id) {
        if (proIDss.get(category).indexOf(pro_id) < 0)
            proIDss.get(category).add(pro_id);
        else
            proIDss.get(category).remove(proIDss.get(category).indexOf(pro_id));
    }

    public String findPricedsByPro() {
        try {
            if (ActionContext.getContext().getSession().get(Key.PROID) == null) {
                proIDss = new ArrayList<>(3);
                for (int i = 0; i < 3; i++)
                    proIDss.add(new ArrayList<>());
            } else {
                proIDss = (List<List<Integer>>) ActionContext.getContext().getSession().get(Key.PROID);
            }

            String category = productService.getProByProID(pro_id);

            if (category != null) {
                switch (category) {
                    case "品牌":
                        handlePro(proIDss, 0, pro_id);
                        break;
                    case "材质":
                        handlePro(proIDss, 1, pro_id);
                        break;
                    case "款式":
                        handlePro(proIDss, 2, pro_id);
                        break;
                }
                ActionContext.getContext().getSession().put(Key.PROID, proIDss);
            }
            priceds = productService.findPricedsByProperty(proIDss.get(0), proIDss.get(1), proIDss.get(2));
            pross = productService.getPross();

            for (int i = 0; i < 3; i++) {
                for (Property property : pross.get(i)) {
                    proIDss.get(i).stream().filter(id -> property.getProId() == id).forEach(id -> {
                        property.setSelected(1);
                    });
                }
            }

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

    public List<List<Integer>> getProIDss() {
        return proIDss;
    }

    public void setProIDss(List<List<Integer>> proIDss) {
        this.proIDss = proIDss;
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

    public List<PricedPro> getPricedpros() {
        return pricedpros;
    }

    public void setPricedpros(List<PricedPro> pricedpros) {
        this.pricedpros = pricedpros;
    }

    public void setFavoriteService(FavoriteService favoriteService) {
        this.favoriteService = favoriteService;
    }

    public int getIsFavor() {
        return isFavor;
    }

    public void setIsFavor(int isFavor) {
        this.isFavor = isFavor;
    }


}