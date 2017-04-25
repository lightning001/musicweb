package demo;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import util.HibernateUtils;

public class BuildCache {
public static void main(String[] args) throws InterruptedException {
	SessionFactory factory = HibernateUtils.getSessionFactory();
	Session session = factory.getCurrentSession();
	FullTextSession fullTextSession = Search.getFullTextSession(session);
	fullTextSession.createIndexer().startAndWait();
}
}
