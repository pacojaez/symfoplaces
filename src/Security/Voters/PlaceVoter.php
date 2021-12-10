<?php 
namespace App\Security\Voters;

use App\Entity\Place;
use App\Entity\User;
use Symfony\Component\Security\Core\Authorization\Voter\Voter;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Security;

class PlaceVoter extends Voter {

    private $security, $operaciones;


    public function __construct( Security $security ){
        $this->security = $security;
        $this->operaciones = ['create', 'edit', 'delete'];
    }

    protected function supports(string $attribute, $subject): bool {

        if( !in_array($attribute, $this->operaciones))
            return false;
        
        if( !$subject instanceof Place )
        return false;

        return true;
    }

    protected function voteOnAttribute( string $attribute, $subject , TokenInterface $token ) {
        
        $user = $token->getUser();
        
        if(!$user instanceof User)
            return false;

        $method = 'can'.ucfirst($attribute);

        return $this->$method($subject, $user);
    }

    private function isOwner( Place $place, ?User $user ): bool {
       
       return $user === $place->getUser();
    }

    private function canCreate(Place $place, ?User $user ): bool {
       
        return true;
    }

    private function canEdit( Place $place, ?User $user ): bool {
       
        return $user === $place->getuser() || $this->security->isGranted('ROLE_EDITOR');
    }

    private function canDelete( Place $place, ?User $user ): bool {
       
        return $this->canEdit( $place, $user );
    }
}