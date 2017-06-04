Feature: Defining Stepflows that accept parameters

  Background:
    Given there's a "features/bootstrap/FeatureContext.php" file with:
      """
      <?php
      use Behat\Behat\Context\Context;

      class FeatureContext implements Context
      {
          /**
          * @Given a :this
          * @Given the :this
          */
          function given($this){
              echo $this;
          }

          /** @When I :that */
          function when($that){
              echo $that;
          }

          /** @Then it :something */
          function then($something){
              echo $something;
          }
      }
      """
    And a "behat.yml" file with:
      """
      default:
        extensions:
          bwowk\Behat\MinkExtension: ~
      """

  Scenario: Defining a parameterized StepFlow by writing a Step block
    Given there's a "features/stepflow.feature" file with:
      """
      Feature: StepFlow
        
        Step: I took :eggs eggs from a|the :container and it now has :n eggs
          Given a <container>
          When I take <eggs> eggs from it
          Then it should have <n> eggs
          
        Scenario: Using a StepFlow
          Given I took 5 eggs from a basket and it now has two eggs
          Given I took 3 eggs from the refrigerator and it now has no eggs
      """
    When I run "behat"
    Then it should pass with:
      """
      Scenario: Using a StepFlow
        Given I took 5 eggs from a basket and it now has two eggs
          | Given a basket
          | When I take 5 eggs from it
          | Then it should have two eggs
        Given I took 3 eggs from the refrigerator and it now has two eggs
          | Given a refrigerator
          | When I take 5 eggs from it
          | Then it should have two eggs
      """