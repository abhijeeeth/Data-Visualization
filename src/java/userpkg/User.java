/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package userpkg;

/**
 *
 * @author Administrator
 */
public class User {
    private String emailid, password, name, mobileno;

    /**
     * @return the userId
     */
    public String getUserId() {
        return emailid;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(String userId) {
        this.emailid = emailid;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
    
    /**
     * @return the name
     */
    public String getMobileNo() {
        return mobileno;
    }

    /**
     * @param name the name to set
     */
    public void setMobileNo(String mobileno) {
        this.mobileno = mobileno;
    }

    void setUserName(String string) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    

    String getUserName() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}