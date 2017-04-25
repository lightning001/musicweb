package DAO;

import org.hibernate.Query;
import org.hibernate.Session;

import entity.Album;
import entity.Playlist;
import entity.Song;
import util.HibernateUtils;

/**
 * Created by congp on 02-Dec-16.
 */
public class ViewDAO {
	public static boolean increaseViewAlbum(int id) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "update " + Album.class.getName()
					+ " e set e.viewcount = (e.viewcount + 1) where e.idAlbum =:id";
			Query query = session.createQuery(hql);
			query.setParameter("id", id);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
		return true;
	}

	public static boolean increaseViewSong(int id) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "update " + Song.class.getName()
					+ " e set e.viewcount = (e.viewcount + 1) where e.idSong =:id";
			Query query = session.createQuery(hql);
			query.setParameter("id", id);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
		return true;
	}

	public static boolean increaseViewPlaylist(int id) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "update " + Playlist.class.getName()
					+ " e set e.viewcount = (e.viewcount + 1) where e.idPlaylist =:id";
			Query query = session.createQuery(hql);
			query.setParameter("id", id);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
		return true;
	}
}
