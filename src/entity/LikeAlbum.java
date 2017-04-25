package entity;

import javax.persistence.*;

/**
 * Created by congp on 30-Dec-16.
 */
@Entity
@Table(name = "like_album", schema = "musicweb", catalog = "")
@IdClass(LikeAlbumPK.class)
public class LikeAlbum {
    private int idUser;
    private int idAlbum;

    @Id
    @Column(name = "idUser")
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    @Id
    @Column(name = "idAlbum")
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

        LikeAlbum likeAlbum = (LikeAlbum) o;

        if (idUser != likeAlbum.idUser) return false;
        if (idAlbum != likeAlbum.idAlbum) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idUser;
        result = 31 * result + idAlbum;
        return result;
    }
}
