package entity;

import javax.persistence.*;

/**
 * Created by congp on 11-Dec-16.
 */
@Entity
@IdClass(ViewalbumPK.class)
public class Viewalbum {
    private int idAlbum;
    private int mounth;
    private int years;
    private Integer viewcount;
    private Album albumByIdAlbum;

    @Id
    @Column(name = "idAlbum", nullable = false)
    public int getIdAlbum() {
        return idAlbum;
    }

    public void setIdAlbum(int idAlbum) {
        this.idAlbum = idAlbum;
    }

    @Id
    @Column(name = "mounth", nullable = false)
    public int getMounth() {
        return mounth;
    }

    public void setMounth(int mounth) {
        this.mounth = mounth;
    }

    @Id
    @Column(name = "years", nullable = false)
    public int getYears() {
        return years;
    }

    public void setYears(int years) {
        this.years = years;
    }

    @Basic
    @Column(name = "viewcount", nullable = true)
    public Integer getViewcount() {
        return viewcount;
    }

    public void setViewcount(Integer viewcount) {
        this.viewcount = viewcount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Viewalbum viewalbum = (Viewalbum) o;

        if (idAlbum != viewalbum.idAlbum) return false;
        if (mounth != viewalbum.mounth) return false;
        if (years != viewalbum.years) return false;
        if (viewcount != null ? !viewcount.equals(viewalbum.viewcount) : viewalbum.viewcount != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idAlbum;
        result = 31 * result + mounth;
        result = 31 * result + years;
        result = 31 * result + (viewcount != null ? viewcount.hashCode() : 0);
        return result;
    }

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name = "idAlbum", referencedColumnName = "idAlbum", nullable = false)
    public Album getAlbumByIdAlbum() {
        return albumByIdAlbum;
    }

    public void setAlbumByIdAlbum(Album albumByIdAlbum) {
        this.albumByIdAlbum = albumByIdAlbum;
    }
}
