<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class ContactFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nombre', TextType::class, [
                'attr' => ['class' => 'form-control m-5'],
                'label_format' => 'Tu nombre',
                'required' => true,
            ] )
            ->add('email', EmailType::class, [
                'attr' => ['class' => 'form-control m-5'],
                'label_format' => 'Tu mail para ponernos en contacto contigo',
                'required' => true,
            ] )
            ->add('asunto', TextType::class, [
                'attr' => ['class' => 'form-control m-5'],
                'label_format' => 'Asunto',
            ] )
            ->add('contenido', TextareaType::class, [
                'attr' => ['class' => 'form-control m-5'],
                'label_format' => 'Cuentanos algo',
                'required' => true,
            ] )
            ->add('Enviar', SubmitType::class, [
                'attr' => ['class' => 'btn btn-primary m-5']
            ] )
            
            ->getForm();
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'csrf_protection' => true,
            'csrf_field_name' => 'SymfoFilmsApp_token',
            'csrf_toke_id' => 'nombreparagenerarlasemilladeltoken',
        ]);
    }
}
