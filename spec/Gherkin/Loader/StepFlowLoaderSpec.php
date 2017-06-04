<?php

namespace spec\bwowk\Behat\StepFlow\Gherkin\Loader;

use bwowk\Behat\StepFlow\Gherkin\Loader\StepFlowLoader;
use PhpSpec\ObjectBehavior;
use Prophecy\Argument;

class StepFlowLoaderSpec extends ObjectBehavior
{
    function it_is_initializable()
    {
        $this->shouldHaveType(StepFlowLoader::class);
    }

    function it_should_be_a_gherkin_loader(){
        $this->shouldBeAnInstanceOf('Behat\Gherkin\Loader\LoaderInterface');
    }

    function it_should_remove_stepflow_definitions_from_the_feature(){
        $this->
    }


}
