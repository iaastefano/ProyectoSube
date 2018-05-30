package dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import datos.Tarjeta;

public class TarjetaDao {
	private static Session session;
	private Transaction tx;

	private void iniciaOperacion() throws HibernateException {
		session = HibernateUtil.getSessionFactory().openSession();
		tx = session.beginTransaction();
	}

	private void manejaExcepcion(HibernateException he) throws HibernateException {
		tx.rollback();
		throw new HibernateException("ERROR en la capa de acceso a datos", he);
	}

	public int agregar(Tarjeta objeto) {
		int id = 0;
		try {
			iniciaOperacion();
			id = Integer.parseInt(session.save(objeto).toString());
			tx.commit();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			session.close();
		}
		return id;
	}

	public void actualizar(Tarjeta objeto) throws HibernateException {
		try {
			iniciaOperacion();
			session.update(objeto);
			tx.commit();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			session.close();
		}
	}

	public void eliminar(Tarjeta objeto) throws HibernateException {
		try {
			iniciaOperacion();
			session.delete(objeto);
			tx.commit();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			session.close();
		}
	}

	public Tarjeta traerTarjeta(long idTarjeta) throws HibernateException {
		Tarjeta objeto = null;
		try {
			iniciaOperacion();
			objeto = (Tarjeta) session.get(Tarjeta.class, idTarjeta);
		} finally {
			session.close();
		}
		return objeto;
	}

	public Tarjeta traerTarjeta(String nroTarjeta) throws HibernateException {
		Tarjeta objeto = null;
		try {
			iniciaOperacion();
			objeto = (Tarjeta) session.createQuery("from Tarjeta t where t.nroTarjeta = '" + nroTarjeta + "'").uniqueResult();
			Hibernate.initialize(objeto.getViajes());
		} finally {
			session.close();
		}
		return objeto;
	}
	
}
