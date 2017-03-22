<?php

namespace vagrant\SampleData;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use LOCKSSOMatic\CrudBundle\Entity\Pln;

/**
 * Creates a PLN.
 */
class LoadPln  extends AbstractFixture implements OrderedFixtureInterface {


    public function getOrder() {
        return 1;
    }

    public function load(ObjectManager $manager) {
        $pln = new Pln();
        $pln->setName('Test PLN');
        $pln->setDescription('A test PLN used in the LOM Vagrant');
        $pln->setKeystore(null);
        $pln->setUsername('admin@example.com');
        $pln->setPassword('admin');
        $manager->persist($pln);

        $manager->flush();

        $this->referenceRepository->setReference('pln', $pln);   
    }

}
