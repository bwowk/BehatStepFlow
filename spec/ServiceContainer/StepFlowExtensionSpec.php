<?php

namespace spec\bwowk\Behat\StepFlow\ServiceContainer;

use bwowk\Behat\StepFlow\ServiceContainer\StepFlowExtension;
use PhpSpec\ObjectBehavior;
use Prophecy\Argument;

class StepFlowExtensionSpec extends ObjectBehavior
{
    function it_is_initializable()
    {
        $this->shouldHaveType(StepFlowExtension::class);
    }

    function it_is_a_testwork_extension()
    {
        $this->shouldHaveType('Behat\Testwork\ServiceContainer\Extension');
    }

    function it_is_named_stepflow()
    {
        $this->getConfigKey()->shouldReturn('stepflow');
    }

}
