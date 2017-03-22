<?php

namespace vagrant\SampleData;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use LOCKSSOMatic\CrudBundle\Entity\Box;

/**
 * Description of LoadBoxes
 */
class LoadBoxes  extends AbstractFixture implements OrderedFixtureInterface {


    public function getOrder() {
        return 2;
    }

    public function load(ObjectManager $manager) {
        $b1 = new Box();
        $b1->setPln($this->referenceRepository->getReference('pln'));
        $b1->setHostname('localhost');
        $b1->setIpAddress('127.0.0.1');
        $b1->setProtocol('TCP');
        $b1->setWebServicePort('8081'); // 8082, 8083, 8084
        $b1->setPort('9721'); // 9722, 9723, 9724
        $manager->persist($b1);

        $b2 = new Box();
        $b2->setPln($this->referenceRepository->getReference('pln'));
        $b2->setHostname('localhost');
        $b2->setIpAddress('127.0.0.1');
        $b2->setProtocol('TCP');
        $b2->setWebServicePort('8082'); // 8082, 8083, 8084
        $b2->setPort('9722'); // 9722, 9723, 9724
        $manager->persist($b2);

        $b3 = new Box();
        $b3->setPln($this->referenceRepository->getReference('pln'));
        $b3->setHostname('localhost');
        $b3->setIpAddress('127.0.0.1');
        $b3->setProtocol('TCP');
        $b3->setWebServicePort('8083'); // 8082, 8083, 8084
        $b3->setPort('9723'); // 9722, 9723, 9724
        $manager->persist($b3);

        $b4 = new Box();
        $b4->setPln($this->referenceRepository->getReference('pln'));
        $b4->setHostname('localhost');
        $b4->setIpAddress('127.0.0.1');
        $b4->setProtocol('TCP');
        $b4->setWebServicePort('8084'); // 8082, 8083, 8084
        $b4->setPort('9724'); // 9722, 9723, 9724
        $manager->persist($b4);

        $manager->flush();
    }

}
