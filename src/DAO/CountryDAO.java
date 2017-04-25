package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import entity.Country;
import util.HibernateUtils;

public class CountryDAO {

	@SuppressWarnings("unchecked")
	public static List<Country> getAllCountry() {
		List<Country> listCountry = new ArrayList<Country>();
		if (listCountry.isEmpty()) {
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();

			try {
				session.getTransaction().begin();
				String hql = "from " + Country.class.getName();
				Query query = session.createQuery(hql);
				listCountry = query.list();
				session.getTransaction().commit();
			} catch (Exception e) {
				e.printStackTrace();
				session.getTransaction().rollback();
			}
		}
		return listCountry;
	}

	public static Country getCountryBySlug(String slug) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		Country country = new Country();
		try {
			session.getTransaction().begin();
			String hql = "from " + Country.class.getName() + " e where e.slugCountry =:slugCountry";
			Query query = session.createQuery(hql);
			query.setParameter("slugCountry", slug);
			country = (Country) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return country;
	}

	public static Country getCountryByName(String name) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		Country country = new Country();
		try {
			session.getTransaction().begin();
			String hql = "from " + Country.class.getName() + " e where e.country =:country";
			Query query = session.createQuery(hql);
			query.setParameter("country", name);
			country = (Country) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return country;
	}

	public static boolean insert(Country country) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.save(country);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static boolean delete(Country country) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.delete(country);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	/**
	 * @param oldCountry:
	 *            truoc khi sua
	 * @param newCountry:
	 *            sau khi sua
	 * @return
	 */
	public static boolean update(Country oldCountry, Country newCountry) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			String hql = "UPDATE " + Country.class.getName()
					+ " SET country=:countrynew, slugCountry=:slug WHERE country=:country";
			Query query = session.createQuery(hql);
			query.setParameter("countrynew", newCountry.getCountry());
			query.setParameter("slug", newCountry.getSlugCountry());
			query.setParameter("country", oldCountry.getCountry());
			int i = query.executeUpdate();
			session.getTransaction().commit();
			if (i > 0)
				return true;
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static boolean update(Country country) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.update(country);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}
}
