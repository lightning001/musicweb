package entity;
// Generated Nov 20, 2016 9:40:14 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Viewcounter generated by hbm2java
 */
@Entity
@Table(name="VIEWCOUNTER"
    ,catalog="musicweb"
)
public class Viewcounter  implements java.io.Serializable {


     private String typeCounter;
     private Integer viewCount;

    public Viewcounter() {
    }

	
    public Viewcounter(String typeCounter) {
        this.typeCounter = typeCounter;
    }
    public Viewcounter(String typeCounter, Integer viewCount) {
       this.typeCounter = typeCounter;
       this.viewCount = viewCount;
    }
   
     @Id 

    
    @Column(name="typeCounter", unique=true, nullable=false, length=100)
    public String getTypeCounter() {
        return this.typeCounter;
    }
    
    public void setTypeCounter(String typeCounter) {
        this.typeCounter = typeCounter;
    }

    
    @Column(name="viewCount")
    public Integer getViewCount() {
        return this.viewCount;
    }
    
    public void setViewCount(Integer viewCount) {
        this.viewCount = viewCount;
    }




}


