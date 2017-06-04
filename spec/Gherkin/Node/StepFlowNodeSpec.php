<?php

namespace spec\bwowk\Behat\StepFlow\Gherkin\Node;

use bwowk\Behat\StepFlow\Gherkin\Node\StepFlowNode;
use PhpSpec\ObjectBehavior;
use Prophecy\Argument;

class StepFlowNodeSpec extends ObjectBehavior
{
    function it_is_initializable()
    {
        $this->shouldHaveType(StepFlowNode::class);
    }

    function it_should_be_a_gherkin_node(){
        $this->shouldBeAnInstanceOf('Behat\Gherkin\Node\NodeInterface');
    }

    function its_node_type_should_be_stepflow(){
        $this->getNodeType()->shouldBe("StepFlow");
    }

}
