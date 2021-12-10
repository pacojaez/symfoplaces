<?php 
namespace App\Security\Voters;

use App\Entity\Photo;
use App\Entity\User;
use Symfony\Component\Security\Core\Authorization\Voter\Voter;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Security;

class PhotoVoter extends Voter {

    private $security, $operaciones;


    public function __construct( Security $security ){
        
        $this->security = $security;
        $this->operaciones = ['create', 'edit', 'delete'];
    }

    protected function supports(string $attribute, $subject): bool {

        if( !in_array($attribute, $this->operaciones))
            return false;
        
        if( !$subject instanceof Photo )
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

    private function isOwner( Photo $photo, ?User $user ): bool {
        if (!$user) {
            return false;
        }

        if($this->security->isGranted('ROLE_ADMIN'))
            return true;

        $place = $photo->getPlace();
        // dd($photo);

        return $user->getId() === $place->getUser()->getId();  
    }

    private function canCreate( Photo $photo, ?User $user ): bool {

        if($this->security->isGranted('ROLE_ADMIN'))
            return true;

        return $user === $photo->getPlace()->getuser();
    }

    private function canEdit(Photo $photo, ?User $user ): bool {

        if($this->security->isGranted('ROLE_ADMIN'))
            return true;
       
        return $this->isOwner($photo, $user );
    }

    private function canDelete( Photo $photo, ?User $user ): bool {

        if($this->security->isGranted('ROLE_ADMIN'))
            return true;
        
        return $this->isOwner( $photo, $user );
    }
}