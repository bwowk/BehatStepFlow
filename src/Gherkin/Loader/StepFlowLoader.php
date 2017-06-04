<?php

namespace bwowk\Behat\StepFlow\Gherkin\Loader;

use Behat\Gherkin\Loader\LoaderInterface;
use Behat\Gherkin\Node\FeatureNode;

class StepFlowLoader implements LoaderInterface
{
    /**
     * Checks if current loader supports provided resource.
     *
     * @param mixed $resource Resource to load
     *
     * @return Boolean
     */
    public function supports($resource)
    {
        // TODO: Implement supports() method.
    }

    /**
     * Loads features from provided resource.
     *
     * @param mixed $resource Resource to load
     *
     * @return FeatureNode[]
     */
    public function load($resource)
    {
        // TODO: Implement load() method.
    }
}
