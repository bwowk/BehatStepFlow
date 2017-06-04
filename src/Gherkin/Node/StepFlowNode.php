<?php

namespace bwowk\Behat\StepFlow\Gherkin\Node;

use Behat\Gherkin\Node\NodeInterface;

class StepFlowNode implements NodeInterface
{
    /**
     * @var integer
     */
    private $line;

    /**
     * Returns node type string
     *
     * @return string
     */
    public function getNodeType()
    {
        return "StepFlow";
    }

    /**
     * Returns feature declaration line number.
     *
     * @return integer
     */
    public function getLine()
    {
        // TODO: Implement getLine() method.
    }
}
