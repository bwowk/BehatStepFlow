Feature: Defining Stepflows on features

  Background:
    Given there's a "features/bootstrap/FeatureContext.php" file with:
      """
      <?php
      use Behat\Behat\Context\Context;

      class FeatureContext implements Context
      {
          /** @Given some context */
          function given(){
              echo "There's some context.";
          }

          /** @When I do something */
          function when(){
              echo "I did something.";
          }

          /** @Then something should happen */
          function then(){
              echo "Something happened.";
          }
      }
      """
    And a "behat.yml" file with:
      """
      default:
        extensions:
          bwowk\Behat\MinkExtension: ~
      """

  Scenario: Defining a StepFlow by writing a Step block
    Given there's a "features/stepflow.feature" file with:
      """
      Feature: StepFlow
        
        Step: I run a StepFlow
          Given some context
          When I do something
          Then something should happen
          
        Scenario: Using a StepFlow
          Given I run a StepFlow
      """
    When I run "behat"
    Then it should pass with:
      """
      Scenario: Using a StepFlow
        Given I run a StepFlow
          | Given some context
          | When I do something
          | Then something should happen
      """

  Scenario Outline: Defining a StepFlow by tagging a Scenario block
    Given there's a "behat.yml" file with:
      """
      default:
        extensions:
          bwowk\Behat\MinkExtension:
            stepflow_tag: <stepflow_tag>

      """
    And a "features/stepflow.feature" file with:
      """
      Feature: StepFlow
        <stepflow_tag>
        Scenario: I run a StepFlow
          Given some context
          When I do something
          Then something should happen

        Scenario: Using a StepFlow
          Given I run a StepFlow
      """
    When I run "behat"
    Then it should pass with:
      """
      Scenario: Using a StepFlow
        Given I run a StepFlow
          | Given some context
          | When I do something
          | Then something should happen
      """

    Scenarios:
      | stepflow_tag |
      | smartStep    |
      | stepflow     |

  Scenario: Throws exception for duplicated stepflows specifying where the duplicates are
    Given there's a "features/stepflow.feature" file with:
      """
      Feature: StepFlow
        Step: I run a StepFlow
          Given some context
          When I do something
          Then something should happen
      """
    And a "features/stepflow_duplicate.feature" file with:
      """
      Feature: StepFlow Duplicate
        Step: I run a StepFlow
          Given some context
          When I do something
          Then something should happen
      """
    When I run "behat"
    Then it should fail with:
      """
       Duplicated definition for `@Step I run a StepFlow`.
       Found on:
        | features/stepflow.feature:2
        | features/stepflow_duplicate.feature:2
       (DuplicateStepFlowDefinitionException)
      """
