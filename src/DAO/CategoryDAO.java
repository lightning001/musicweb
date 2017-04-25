
package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;

import entity.Category;
import util.HibernateUtils;

public class CategoryDAO {

	@SuppressWarnings("unchecked")
	public static List<Category> getAllCat() {
		List<Category> listCategory = new ArrayList<Category>();
		if (listCategory.size() == 0) {
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();

			try {
				session.getTransaction().begin();
				String hql = "from " + Category.class.getName() + " e";
				Query query = session.createQuery(hql);
				listCategory = query.list();
				session.getTransaction().commit();
			} catch (Exception e) {
				e.printStackTrace();
				session.getTransaction().rollback();
			}
		}
		return listCategory;
	}

	public static Category getCategoryByID(int id) {
		Category c = null;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Category.class.getName() + " e where e.idCategory =:idCategory";
			Query query = session.createQuery(hql);
			query.setParameter("idCategory", id);
			c = (Category) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return c;
	}

	public static Category getCategoryByNameAndCountry(String name, String country) {
		Category c = null;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Category.class.getName()
					+ " e where e.category =:category and e.country.country =:country";
			Query query = session.createQuery(hql);
			query.setParameter("category", name);
			query.setParameter("country", country);
			c = (Category) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return c;
	}

	public static Category getCategoryBySlug(String slug) {
		Category c = null;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Category.class.getName() + " e where e.slugCategory =:slug";
			Query query = session.createQuery(hql);
			query.setParameter("slug", slug);
			c = (Category) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return c;
	}

	public static Category getCategoryByName(String name) {
		Category c = null;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Category.class.getName() + " e where e.category =:category";
			Query query = session.createQuery(hql);
			query.setParameter("category", name);
			c = (Category) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return c;
	}

	public static int getLastId() {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		int s = 0;
		try {
			session.getTransaction().begin();
			String hql = "select max(idCategory) from " + Category.class.getName() + " e order by e.idCategory desc";
			Query query = session.createQuery(hql);
			query.setMaxResults(1);
			s = (int) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return s;
	}

	@SuppressWarnings({ "unused", "unchecked" })
	public static List<Category> pagingCategory(int page, int pageSize) {

		List<Category> listCategory = new ArrayList<Category>();
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "select distinct * from " + Category.class.getName() + " e order by e.idPlaylist asc";
			Criteria criteria = session.createCriteria(Category.class);
			criteria.setFirstResult((page - 1) * pageSize);
			criteria.setMaxResults(pageSize);
			Criteria criteriaCount = session.createCriteria(Category.class);
			listCategory = criteria.list();
			criteriaCount.setProjection(Projections.rowCount());
			Long count = (Long) criteriaCount.uniqueResult();

			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return listCategory;
	}

	public static long getPageCount() {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		long count = 0;
		try {
			session.getTransaction().begin();
			Criteria criteriaCount = session.createCriteria(Category.class);
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

	public static boolean insert(Category category) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.save(category);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static boolean delete(Category category) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.delete(category);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static boolean update(Category category) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.update(category);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}
}
