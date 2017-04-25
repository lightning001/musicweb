package entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by congp on 11-Dec-16.
 */
public class ViewalbumPK implements Serializable {
    private int idAlbum;
    private int mounth;
    private int years;

    @Column(name = "idAlbum", nullable = false, insertable = false,updatable = false)
    @Id
    public int getIdAlbum() {
        return idAlbum;
    }

    public void setIdAlbum(int idAlbum) {
        this.idAlbum = idAlbum;
    }

    @Column(name = "mounth", nullable = false)
    @Id
    public int getMounth() {
        return mounth;
    }

    public void setMounth(int mounth) {
        this.mounth = mounth;
    }

    @Column(name = "years", nullable = false)
    @Id
    public int getYears() {
        return years;
    }

    public void setYears(int years) {
        this.years = years;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ViewalbumPK that = (ViewalbumPK) o;

        if (idAlbum != that.idAlbum) return false;
        if (mounth != that.mounth) return false;
        if (years != that.years) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idAlbum;
        result = 31 * result + mounth;
        result = 31 * result + years;
        return result;
    }
}
