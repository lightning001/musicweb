package DAO;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;

import entity.Playlist;
import entity.Singer;
import util.HibernateUtils;

public class PlaylistDAO {

	@SuppressWarnings("unchecked")
	public static List<Playlist> getNewPlaylist() {
		List<Playlist> playlists = new ArrayList<Playlist>();

		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Playlist.class.getName() + " e order by e.idPlaylist desc";
			Query query = session.createQuery(hql);
			query.setMaxResults(8);
			playlists = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return playlists;
	}

	public static Playlist getPlaylistBySlug(String slug) {
		Playlist playlist = null;

		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Playlist.class.getName() + " e where e.slugPlaylist =:slugPlaylist";
			Query query = session.createQuery(hql);
			query.setParameter("slugPlaylist", slug);
			playlist = (Playlist) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return playlist;
	}

	public static Playlist getPlaylistById(int id) {
		Playlist playlist = null;

		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Playlist.class.getName() + " e where e.idPlaylist =:idPlaylist";
			Query query = session.createQuery(hql);
			query.setParameter("idPlaylist", id);
			playlist = (Playlist) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return playlist;
	}

	@SuppressWarnings("unchecked")
	public static List<Playlist> getAllPlaylist() {
		List<Playlist> listPlaylist = new ArrayList<Playlist>();
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Playlist.class.getName() + " e order by e.idPlaylist desc";
			Query query = session.createQuery(hql);
			listPlaylist = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return listPlaylist;
	}

	@SuppressWarnings("unchecked")
	public static List<Playlist> getPlaylistByArtist(Singer singer) {
		List<Playlist> playlists = new ArrayList<Playlist>();
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "from " + Playlist.class.getName() + " e where e.singer=:singer";
			Query query = session.createQuery(hql);
			query.setParameter("singer", singer);
			query.setMaxResults(8);
			playlists = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		Collections.shuffle(playlists);
		return playlists;
	}

	public static int getLastID() {
		int result = 0;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "select max(idPlaylist) from " + Playlist.class.getName();
			Query query = session.createQuery(hql);
			query.setMaxResults(1);
			result = (int) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return result;
	}

	@SuppressWarnings({ "unchecked" })
	public static List<Playlist> pagingPlaylist(int page, int pageSize) {

		List<Playlist> listPlaylist = new ArrayList<Playlist>();
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Playlist.class.getName() + " e order by e.idPlaylist asc";
			Query query = session.createQuery(hql);
			query.setFirstResult((page - 1) * pageSize);
			query.setMaxResults(pageSize);
			listPlaylist = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return listPlaylist;
	}

	public static long getPageCount() {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		long count = 0;
		try {
			session.getTransaction().begin();
			Criteria criteriaCount = session.createCriteria(Playlist.class);
			criteriaCount.setProjection(Projections.rowCount());
			count = (long) criteriaCount.uniqueResult();
			session.getTransaction().commit();
			if (count % 10 == 0) {
				count = count / 10;
			} else {
				count = count / 10 + 1;
			}
		} catch (Exception e) {
			session.getTransaction().rollback();
		}
		return count;
	}

	public static boolean insert(Playlist playlist) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.save(playlist);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static boolean delete(Playlist playlist) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.delete(playlist);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static boolean update(Playlist playlist) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.update(playlist);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

}
