<?php

namespace App\Repository;

use App\Entity\Place;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\Common\Collections\Criteria;

/**
 * @method Place|null find($id, $lockMode = null, $lockVersion = null)
 * @method Place|null findOneBy(array $criteria, array $orderBy = null)
 * @method Place[]    findAll()
 * @method Place[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PlaceRepository extends ServiceEntityRepository
{
    public function __construct( ManagerRegistry $registry )
    {
        parent::__construct($registry, Place::class);
    }

    /**
     * @return Movie[] Returns an array of Movie objects
     */
    public function findLastsWithPhoto ( int $numeroPlaces  ): Array { 

        // $em = $this->getEntityManager();

        // $query = $em->createQuery(
        //     'SELECT p
        //     FROM App\Entity\Place p
        //     ');
            
        // $places = $query->getResult();
        // // dd($places);
        // foreach( $places as $place){
        //     // dd(gettype($place->getPhotos()));
        //     // if( empty( $place->getPhotos() ) )
        //     // dd($place);
        //     foreach($place->getPhotos() as $photo){
        //         // dd($photo->getPlace()->count);
        //     }

        // }
        // // $criteria = Criteria::create()
        // //     ->where(Criteria::expr()->)
        
        // // dd($places);

        // return $places;
        
    }

    // /**
    //  * @return Place[] Returns an array of Place objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Place
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
