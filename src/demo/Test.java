package demo;

import entity.Song;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import util.HibernateUtils;

import java.util.List;

public class Test {
	public static void main(String[] args) throws InterruptedException {
		SessionFactory factory = HibernateUtils.getSessionFactory();

		Session session = factory.getCurrentSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);
		// fullTextSession.createIndexer().startAndWait();
		Transaction tx = fullTextSession.beginTransaction();
		QueryBuilder qb = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(Song.class).get();
		org.apache.lucene.search.Query query = ((org.hibernate.search.query.dsl.QueryBuilder) qb).keyword()
				.onFields("nameSong", "keyWord", "singers.nameSinger").matching("").createQuery();
		// wrap Lucene query in a org.hibernate.Query
		org.hibernate.Query hibQuery = fullTextSession.createFullTextQuery(query, Song.class);
		// execute search
		List<Song> result = hibQuery.list();
		System.out.println(result.size());
		for (Song so : result) {
			System.out.println(so.toString());
		}
	}
}
