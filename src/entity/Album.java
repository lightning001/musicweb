package entity;
// Generated Nov 20, 2016 9:40:14 PM by Hibernate Tools 4.3.1


import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Index;

import javax.persistence.*;
import java.util.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * Album generated by hbm2java
 */
@Entity
@Indexed
@Table(name="ALBUM"
    ,catalog="musicweb"
    , uniqueConstraints = @UniqueConstraint(columnNames="slugAlbum") 
)
public class Album  implements java.io.Serializable {
     private Integer idAlbum;
     private Category category;
     private Country country;
     private String nameAlbum;
     private String keyWord;
     private String slugAlbum;
     private Date postDate;
     private Integer viewcount;
     private String linkImg;
     private String infoAlbum;
     private List<Users> userses = new ArrayList<Users>(0);
     private List<Singer> singers = new ArrayList<Singer>(0);
     private Set<CommentAlbum> commentAlbums = new HashSet<CommentAlbum>(0);
     private List<Song> songs = new ArrayList<Song>(0);

    public Album() {
    }

	
    public Album(String nameAlbum, Date postDate, String linkImg) {
        this.nameAlbum = nameAlbum;
        this.postDate = postDate;
        this.linkImg = linkImg;
    }
    public Album(Category category, Country country, String nameAlbum, String keyWord, String slugAlbum, Date postDate, Integer viewcount, String linkImg, String infoAlbum, List<Users> userses, List<Singer> singers, Set<CommentAlbum> commentAlbums, List<Song> songs) {
       this.category = category;
       this.country = country;
       this.nameAlbum = nameAlbum;
       this.keyWord = keyWord;
       this.slugAlbum = slugAlbum;
       this.postDate = postDate;
       this.viewcount = viewcount;
       this.linkImg = linkImg;
       this.infoAlbum = infoAlbum;
       this.userses = userses;
       this.singers = singers;
       this.commentAlbums = commentAlbums;
       this.songs = songs;
    }

    public Album(Integer idAlbum, Category category, Country country, String nameAlbum, String keyWord, String slugAlbum, Date postDate, Integer viewcount, String linkImg, String infoAlbum, List<Users> userses, List<Singer> singers, Set<CommentAlbum> commentAlbums, List<Song> songs) {
        this.idAlbum = idAlbum;
        this.category = category;
        this.country = country;
        this.nameAlbum = nameAlbum;
        this.keyWord = keyWord;
        this.slugAlbum = slugAlbum;
        this.postDate = postDate;
        this.viewcount = viewcount;
        this.linkImg = linkImg;
        this.infoAlbum = infoAlbum;
        this.userses = userses;
        this.singers = singers;
        this.commentAlbums = commentAlbums;
        this.songs = songs;
    }

    @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="idAlbum", unique=true, nullable=false)
    public Integer getIdAlbum() {
        return this.idAlbum;
    }
    
    public void setIdAlbum(Integer idAlbum) {
        this.idAlbum = idAlbum;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="idCategory")
    public Category getCategory() {
        return this.category;
    }
    
    public void setCategory(Category category) {
        this.category = category;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="country")
    public Country getCountry() {
        return this.country;
    }
    
    public void setCountry(Country country) {
        this.country = country;
    }


    @Field(index= org.hibernate.search.annotations.Index.YES, analyze=Analyze.YES, store=Store.NO)
    @Column(name="nameAlbum", nullable=false, length=500)
    public String getNameAlbum() {
        return this.nameAlbum;
    }
    
    public void setNameAlbum(String nameAlbum) {
        this.nameAlbum = nameAlbum;
    }


    @Field(index= Index.YES, analyze=Analyze.YES, store=Store.NO)
    @Column(name="keyWord", length=500)
    public String getKeyWord() {
        return this.keyWord;
    }
    
    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    
    @Column(name="slugAlbum", unique=true, length=600)
    public String getSlugAlbum() {
        return this.slugAlbum;
    }
    
    public void setSlugAlbum(String slugAlbum) {
        this.slugAlbum = slugAlbum;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="postDate", nullable=false, length=19)
    public Date getPostDate() {
        return this.postDate;
    }
    
    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    
    @Column(name="viewcount")
    public Integer getViewcount() {
        return this.viewcount;
    }
    
    public void setViewcount(Integer viewcount) {
        this.viewcount = viewcount;
    }

    
    @Column(name="linkImg", nullable=false, length=500)
    public String getLinkImg() {
        return this.linkImg;
    }
    
    public void setLinkImg(String linkImg) {
        this.linkImg = linkImg;
    }

    
    @Column(name="infoAlbum", length=4000)
    public String getInfoAlbum() {
        return this.infoAlbum;
    }
    
    public void setInfoAlbum(String infoAlbum) {
        this.infoAlbum = infoAlbum;
    }

@ManyToMany(fetch=FetchType.LAZY, mappedBy="albums")
    public List<Users> getUserses() {
        return this.userses;
    }
    
    public void setUserses(List<Users> userses) {
        this.userses = userses;
    }

@IndexedEmbedded
@ManyToMany(fetch=FetchType.EAGER)
    @JoinTable(name="ALBUM_AUTHOR", catalog="musicweb", joinColumns = { 
        @JoinColumn(name="idAlbum", nullable=false, updatable=false) }, inverseJoinColumns = { 
        @JoinColumn(name="idSinger", nullable=false, updatable=false) })
    public List<Singer> getSingers() {
        return this.singers;
    }
    
    public void setSingers(List<Singer> singers) {
        this.singers = singers;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="album")
    public Set<CommentAlbum> getCommentAlbums() {
        return this.commentAlbums;
    }
    
    public void setCommentAlbums(Set<CommentAlbum> commentAlbums) {
        this.commentAlbums = commentAlbums;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="album")
    public List<Song> getSongs() {
        return this.songs;
    }
    
    public void setSongs(List<Song> songs) {
        this.songs = songs;
    }

    public String toJson(){
        return "{ \"nameAlbum\":\"" + nameAlbum + "\" , \"slugAlbum\":\"" + slugAlbum + "\"}";
    }


}


