package DAO;

import entity.Album;
import entity.LikeAlbum;
import entity.LikeSong;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtils;

/**
 * Created by congp on 30-Dec-16.
 */
public class LikeDAO {
    public static boolean likeSong(int userID, int songID) {
        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
        try {
            session.getTransaction().begin();
            LikeSong ls = new LikeSong();
            ls.setIdUser(userID);
            ls.setIdSong(songID);
            session.save(ls);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return false;
        }
    }

    public static boolean unLikeSong(int userID, int songID) {
        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
        try {
            session.getTransaction().begin();
            LikeSong ls = new LikeSong();
            ls.setIdUser(userID);
            ls.setIdSong(songID);
            session.delete(ls);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return false;
        }
    }

    public static boolean likeAlbum(int userID, int albumID) {
        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
        try {
            session.getTransaction().begin();
            LikeAlbum la = new LikeAlbum();
            la.setIdUser(userID);
            la.setIdAlbum(albumID);
            session.save(la);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return false;
        }
    }

    public static boolean unLikeAlbum(int userID, int albumID) {
        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
        try {
            session.getTransaction().begin();
            LikeAlbum la = new LikeAlbum();
            la.setIdUser(userID);
            la.setIdAlbum(albumID);
            session.delete(la);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return false;
        }
    }

    public static boolean checkLikedSong(int userID, int songID) {
        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
        try {
            session.getTransaction().begin();
            String hql = "from " + LikeSong.class.getName() + " e where e.idUser =:userID and e.idSong =:songID";
            Query query = session.createQuery(hql);
            query.setParameter("userID", userID);
            query.setParameter("songID", songID);
            LikeSong ls = (LikeSong) query.uniqueResult();
            session.getTransaction().commit();
            if (ls != null) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return false;
        }
    }

    public static boolean checkLikedAlbum(int userID, int albumID) {
        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
        try {
            session.getTransaction().begin();
            String hql = "from " + LikeAlbum.class.getName() + " e where e.idUser =:userID and e.idAlbum =:albumID";
            Query query = session.createQuery(hql);
            query.setParameter("userID", userID);
            query.setParameter("songID", albumID);
            LikeSong ls = (LikeSong) query.uniqueResult();
            session.getTransaction().commit();
            if (ls != null) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return false;
        }
    }


    public static void main(String[] args) {
        //System.out.println(likeSong(1,1));
        System.out.println(checkLikedSong(2, 8));
    }
}
