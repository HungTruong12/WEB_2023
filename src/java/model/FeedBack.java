package model;

public class FeedBack {

    private int id;
    private String comment;
    private int rate;
    private User u;

    public FeedBack(int id, String comment, int rate, User u) {
        this.id = id;
        this.comment = comment;
        this.rate = rate;
        this.u = u;
    }
    
    public FeedBack(int id, String comment, int rate) {
        this.id = id;
        this.comment = comment;
        this.rate = rate;
    }
    
    public int getId() {
        return id;
    }

    public String getComment() {
        return comment;
    }

    public int getRate() {
        return rate;
    }

    public User getU() {
        return u;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public void setU(User u) {
        this.u = u;
    }
    
}