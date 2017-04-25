package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.QueryBuilder;

import entity.Album;
import entity.Playlist;
import entity.Singer;
import entity.Song;
import util.HibernateUtils;

public class SearchDAO {
	private SessionFactory factory;
	private FullTextSession fullTextSession;

	public SearchDAO() {
		factory = HibernateUtils.getSessionFactory();
	}
	public static void main(String[] args) {
		SearchDAO searchDAO = new SearchDAO();
		System.out.println("hhhh");
		for(Song e : searchDAO.searchSong("Kỉ niệm bay xa")){
			System.out.println("Bai hat: "+e.getNameSong());
		}
		searchDAO.factory.close();
	}

	@SuppressWarnings("unchecked")
	public  List<Song> searchSong(String key) {
		Session session = factory.getCurrentSession();
		List<Song> result = new ArrayList<Song>();
		try {
			fullTextSession = Search.getFullTextSession(session);
			Transaction tx = fullTextSession.beginTransaction();
			QueryBuilder qb = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(Song.class).get();
			org.apache.lucene.search.Query query = ((org.hibernate.search.query.dsl.QueryBuilder) qb).keyword()
					.onFields("nameSong", "keyWord", "singers.nameSinger").matching(key).createQuery();
			// wrap Lucene query in a org.hibernate.Query
			org.hibernate.Query hibQuery = fullTextSession.createFullTextQuery(query, Song.class);
			hibQuery.setMaxResults(5);
			// execute searchSong
			result = hibQuery.list();
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	@SuppressWarnings("unchecked")
	public List<Album> searchAlbum(String key){
		Session session = factory.getCurrentSession();
		List<Album> result = new ArrayList<Album>();
		try {
			fullTextSession = Search.getFullTextSession(session);
			Transaction tx = fullTextSession.beginTransaction();
			QueryBuilder qb = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(Album.class).get();
			org.apache.lucene.search.Query query = ((org.hibernate.search.query.dsl.QueryBuilder) qb).keyword()
					.onFields("nameAlbum", "keyWord", "singers.nameSinger").matching(key).createQuery();
			// wrap Lucene query in a org.hibernate.Query
			org.hibernate.Query hibQuery = fullTextSession.createFullTextQuery(query, Album.class);
			hibQuery.setMaxResults(5);
			// execute searchSong
			result = hibQuery.list();
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Playlist> searchPlaylist(String key){
		Session session = factory.getCurrentSession();
		List<Playlist> result = new ArrayList<Playlist>();
		try {
			fullTextSession = Search.getFullTextSession(session);
			Transaction tx = fullTextSession.beginTransaction();
			QueryBuilder qb = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(Playlist.class).get();
			org.apache.lucene.search.Query query = ((org.hibernate.search.query.dsl.QueryBuilder) qb).keyword()
					.onFields("namePlaylist", "keyWord", "singers.nameSinger").matching(key).createQuery();
			// wrap Lucene query in a org.hibernate.Query
			org.hibernate.Query hibQuery = fullTextSession.createFullTextQuery(query, Playlist.class);
			hibQuery.setMaxResults(5);
			// execute searchSong
			result = hibQuery.list();
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	

	@SuppressWarnings("unchecked")
	public List<Singer> searchSinger(String key) {
		Session session = factory.getCurrentSession();
		List<Singer> result = new ArrayList<Singer>();
		try {
			fullTextSession = Search.getFullTextSession(session);
			Transaction tx = fullTextSession.beginTransaction();
			QueryBuilder qb = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(Singer.class).get();
			org.apache.lucene.search.Query query = ((org.hibernate.search.query.dsl.QueryBuilder) qb).keyword()
					.onFields("nameSinger", "keyWord").matching(key).createQuery();
			// wrap Lucene query in a org.hibernate.Query
			org.hibernate.Query hibQuery = fullTextSession.createFullTextQuery(query, Singer.class);
			hibQuery.setMaxResults(5);
			// execute searchSong
			result = hibQuery.list();
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
}
