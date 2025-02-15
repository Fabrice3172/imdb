package fr.diginamic.imdb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fr.diginamic.imdb.entity.Lieu;

@Repository
public interface LieuRepository extends JpaRepository<Lieu, Integer> {

}
