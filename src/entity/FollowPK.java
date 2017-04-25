package entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by congp on 30-Dec-16.
 */
public class FollowPK implements Serializable {
    private int idUser;
    private int idSinger;

    @Column(name = "idUser")
    @Id
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    @Column(name = "idSinger")
    @Id
    public int getIdSinger() {
        return idSinger;
    }

    public void setIdSinger(int idSinger) {
        this.idSinger = idSinger;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        FollowPK followPK = (FollowPK) o;

        if (idUser != followPK.idUser) return false;
        if (idSinger != followPK.idSinger) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idUser;
        result = 31 * result + idSinger;
        return result;
    }
}
