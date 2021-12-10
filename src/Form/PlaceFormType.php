<?php

namespace App\Form;

use App\Entity\Place;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

/* use for form */
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class PlaceFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('titulo', TextType::class, [
                'attr' => ['class' => 'form-control'],
                'label_format' => 'NOMBRE DEL LUGAR',
            ])
            ->add('country', TextType::class, [
                'attr' => ['class' => 'form-control'],
                'label_format' => 'PAÍS',
                'required' => false,
            ])
            ->add('city', TextType::class, [
                'attr' => ['class' => 'form-control'],
                'label_format' => 'CIUDAD',
                'required' => false,
            ])
            ->add('text', TextareaType::class, [
                'attr' => [
                    'class' => 'form-control',
                    'rows' => 100,
                    'cols' => 50
                ],
                'label_format' => 'DESCRIPCIÓN',
                'required' => false,
            ])
            ->add('type', TextType::class, [
                'attr' => ['class' => 'form-control'],
                'label_format' => 'TIPO DE LUGAR',
                'required' => false,
            ])
            ->add('valoration', NumberType::class, [
                'attr' => ['max' => 5],
                'attr' => ['class' => 'form-control'],            
                'label_format' => 'VALORACIÓN (Del 1 al 5)',
                'empty_data' => 0,
                'html5' => true,
                'required' => false,
            ])
            ->add('Guardar', SubmitType::class, [
                'attr' => ['class' => 'btn btn-primary text-center m-5']
                ]
            )
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Place::class,
        ]);
    }
}
