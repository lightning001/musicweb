package DAO;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import entity.Lyric;
import util.HibernateUtils;

public class LyricDAO {

	public static String getLyricById(int id) {
		String lyric = "";
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "Select e.lyric from " + Lyric.class.getName() + " e where e.idSong = :idSong";
			Query query = session.createQuery(hql);
			query.setParameter("idSong", id);
			lyric = (String) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return null;
		}
		return lyric;
	}

	public static void main(String[] args) {
		System.out.println(getLyricById(1));
	}

	public static boolean insert(Lyric lyric) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		try {
			session.beginTransaction();
			session.save(lyric);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static boolean update(Lyric lyric) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(lyric);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}
}
