package entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by congp on 30-Dec-16.
 */
public class LikeAlbumPK implements Serializable {
    private int idUser;
    private int idAlbum;

    @Column(name = "idUser")
    @Id
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    @Column(name = "idAlbum")
    @Id
    public int getIdAlbum() {
        return idAlbum;
    }

    public void setIdAlbum(int idAlbum) {
        this.idAlbum = idAlbum;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LikeAlbumPK that = (LikeAlbumPK) o;

        if (idUser != that.idUser) return false;
        if (idAlbum != that.idAlbum) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idUser;
        result = 31 * result + idAlbum;
        return result;
    }
}
