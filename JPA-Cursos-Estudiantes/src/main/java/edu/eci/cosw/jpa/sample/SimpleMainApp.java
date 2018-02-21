/*
 * Copyright (C) 2016 hcadavid
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package edu.eci.cosw.jpa.sample;

import edu.eci.cosw.jpa.sample.model.Curso;
import edu.eci.cosw.jpa.sample.model.Estudiante;
import java.util.HashSet;
import java.util.Set;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 *
 * @author hcadavid
 */
public class SimpleMainApp {
   
    public static void main(String a[]){
        SessionFactory sf=getSessionFactory();
        Session s=sf.openSession();
        Transaction tx=s.beginTransaction();
        
        Curso c1 = new Curso(1, "Costruccion de Software", "COSW");
        Curso c2 = new Curso(2, "Soluciones de Software", "SOSW");
        Estudiante e1 = new Estudiante(01234, "Felipe");
        Estudiante e2 = new Estudiante(56789, "Pipe");
        Set<Curso> cursos = new HashSet();
        cursos.add(c2);cursos.add(c1);
        Set<Estudiante> estudiantes = new HashSet();
        estudiantes.add(e2);estudiantes.add(e1);
        e1.setCursos(cursos);
        e2.setCursos(cursos);
        c1.setEstudianteses(estudiantes);
        c2.setEstudianteses(estudiantes);
        s.saveOrUpdate(e1);s.saveOrUpdate(e2);
        s.saveOrUpdate(c1);s.saveOrUpdate(c2);
        Estudiante e  = (Estudiante) s.load(Estudiante.class, 12345);
        System.out.println("--Cursos Felipe--");
        e.getCursos().forEach(System.out::println);
        Curso c = (Curso) s.load(Curso.class, 5);
        System.out.println("--Cursos Pipe--");
        c.getEstudianteses().forEach(System.out::println);
        
        tx.commit(); 
        s.close();
        sf.close();
    }

    public static SessionFactory getSessionFactory() {
        // loads configuration and mappings
        Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
        ServiceRegistry serviceRegistry
                = new StandardServiceRegistryBuilder()
                .applySettings(configuration.getProperties()).build();

        // builds a session factory from the service registry
        SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        return sessionFactory;
    }

}
