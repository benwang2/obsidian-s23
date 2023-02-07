## Decision Trees
Decision tree learning is a method for approximating discrete-valued target functions, in which the learned function is represented by a decision tree.

#decision_tree
Decision tree learning is among the most popular **inductive reference algorithms**.

### Representation
```mermaid
graph TD;
	Outlook -->|Sunny| Humidity;
	Outlook -->|Overcast| 1[Yes];
	Outlook -->|Rain| Wind;
	Humidity -->|High| 2[No];
	Humidity -->|Normal| 3[Yes];
	Wind -->|Strong| 4[No];
	Wind -->|Weak| 5[Yes];
```

Decision trees classify instances by sorting them down the tree from the root to some leaf node, which provides the classification of the instance. Each node in the tree specifies a test of some *attribute* of the instance, and each branch descending from that node corresponds to one of the possible values for the attribute.

For an example, \<Outlook = Sunny, Temperature = Hot, Humidity = High, Wind = Strong\>, we would sort down the middle path. In this case, it would be considered a **negative instance**.

If we had an \<Outlook = Overcast\>, then it would be sorted down the leftmost branch and be considered a **positive instance**. It is a **positive instance** because the tree predicts **yes** for the result.

### Appropriate problems
Decision tree learning is an excellent tool, but it is best suited to specific types of problems. These problems have the following characteristics:
- *Instances represented by attribute* -value pairs (e.g, temperature - hot, mild, cold) but it's best to have a small number of disjoint values.
- *The target function has discrete output values* -yes or no. However, decision trees can extend to more than two values. It can not handle continuous values.
- *Disjunctive descriptions may be required*: Decision trees naturally represent disjunctive expressions.
- *Training data may contain errors* - decision trees are robust to errors in classification and attribute values
- *Training data may contain missing attribute values* - decision tree methods can be used even when there are unknown values

### Iterative Dichotomiser 3 (ID3)
The algorithm we will study, called ID3 for short, learns decision trees by constructing them top-down, beginning with the question, "which attribute should be tested at the root of tree?"

Each instance attribute is evaluated using a statistical test to determine how well it alone classifies the training examples. The best attribute is selected and used as the test at the root node of the tree.

A descendant of the root node is then created for each possible value of this attribute, and the training examples are sorted to the appropriate descendant node (i.e. down the branch corresponding to the example's value for this attribute).

This process is repeated using training examples for each descendant node to select the best attribute to test at that point.

This forms a greedy search for an acceptable decision tree, in which the algorithm never has to backtrack.

#### Identifying the Best Classifying Attribute
We use a statistical property called *information gain* that measures how well a given attribute separates the training examples according to their target classification. ID3 uses this information gain measure to select among the candidate at tributes at each step while growing the tree.

**Information gain** is defined by a measure commonly used in information theory: *entropy*, which characterizes the impurity of an arbitrary collection of examples.

#information_gain

Given a collection $S$, containing postive and negative examples of some target concept, the entropy of $S$ relative to this boolean clasification is
$$\text{Entropy}(S) \equiv -p_\oplus log_2p_\oplus-p_\ominus log_2 p_\ominus$$
#entropy

#### Example
Suppose in our set $S$ is a collection of 14 examples of some boolean concept, including 9 positive and 5 negative examples, written as \[9+,5-\].

For this collection, we use the entropy equation and compute:
$$\begin{align}
\text{Entropy}([9+,5-]) &= -\frac{9}{14}log_2(\frac{9}{14})-\frac{5}{14}log_2(\frac{5}{14}) \\
&= 0.940
\end{align}$$

The entropy function will yield a number between 0 and 1.

The entropy is 1 when the collection contains an equal amount of positive and negative examples. 

The entropy is closer to 0 when the collection is composed of either mostly negative values, or mostly positive values. (e.g. all positive values or all negative values, entropy=1).

However, examples can take on more than 2 values - they may take on $c$ different values. In this case, we use something called the c-wise classification, which is defined as:

$$\text{Entropy}(S) \equiv \sum_{i=1}^{c}-p_ilog_2p_i$$
In the case the target attribute can take on *c* possible values, the entropy can be as large as $log_2c$.

### Information Gain and Entropy
Given entropy as a measure of impurity in a collection of training examples, we can now define a measure of the effectiveness of an attribute in classifying the data.

The measure used (information gain) is simply the expected reduction in entropy caused by partitioning the examples according to this attribute.

We define this information gain as $\text{Gain}(S,A)$ of an attribute A, relative to a collection of examples S.

$$\text{Gain}(S, A) \equiv \text{Entropy}(S) - \sum_{v\in\text{Values}(A)} \frac{\lvert S_v \rvert}{\lvert S \rvert}\text{Entropy}(S_v)$$

where $\text{Values}(A)$ is the set of all possible values for attribute A, and $S_v$ is the subset of S for which attribute A has value **v** (i.e. $S_v = {s \in S\mid A(s) =v}$). Note that the first term in Equation is just the entropy of the original collection *S* and the second term is the expected value of the entropy of the original collection S.

The value of $\text{Gain}(S,A)$  is the expected reduction in entropy caused by knowing the value of attribute $A$. It is the information provided about the *target function value*, given the value of some other attribute *A*.

The value of $\text{Gain}(S,A)$ is the number of bits saved when encoding the target value of an arbitrary member of *S*, by knowing the value of attribute *A*. 

#### Example
Suppose *S* is a collection of training-example days described by attributes including *Wind*, which can have the values *Weak* or *Strong*. Assume that *S* is a collection of 14 examples, \[9+, 5-\]. Suppose 6 of the positive and 2 of the negative examples have *Wind = Weak* and the others have *Wind = Strong*.

Therefore, we compute the information gain due to sorting *S* by the attribute *Wind* may be calculated as:

$$\begin{align}
\text{Values}(Wind) &= \text{Weak, Strong} \\
S &= [9+, 5-] \\
S_{Weak} &\leftarrow [6+,2-] \\
S_{Strong} &\leftarrow [3+,3-] \\
\end{align}$$

Then, we may compute $\text{Gain}(S, Wind)$.

$$\begin{align}
\text{Gain}(S, \text{Wind}) &= \text{Entropy}(S) - \sum_{v\in\text{\{Weak,Strong\}}}\frac{\lvert S_v \rvert}{\lvert S \rvert}\text{Entropy}(S_v) \\
&= \text{Entropy}(S) - \frac{8}{14}\text{Entropy}(S_{\text{Weak}}) \\
&\quad-\frac{6}{14}\text{Entropy}(S_{Strong}) \\
&= 0.940 - \frac{8}{14}\cdot0.811-\frac{6}{14}\cdot1.00\\
&= 0.048
\end{align}$$


This information gain is precisely the measure used by ID3 to select the best attribute at each step in growing the tree. 

The greater the value of $\text{Gain}(S, A)$, the greater the information gain.

For each node, we determine which attribute to test by selecting the attribute test with the greatest information gain at that point in the tree.

Following the selection of a test attribute, we repeat the process for the descendant nodes of the node.

![[Pasted image 20230203185020.png | center]]


### Advantages and Disadvantages of ID3

Because ID3 performs no backtracking in its search, it is susceptible to converging to a locally optimal solution that is not globally optimal. Furthermore, it does not have the ability to determine how many alternative decision trees are consistent with the available training data.

ID3 is resilient to errors and noise within the training data.

**Occam's razor**: Prefer the simplest hypothesis that fits the data.
#occams_razor

ID3 prefers shorter decision trees.

### Handling Overfitting
We say a hypothesis **overfits** the training examples if some other hypothesis that fits the training examples less well actually performs better over the entire distribution of instances (i.e. including instances beyond the training set).

The formal definition is as follows:
Given a hypothesis space H, a hypothesis $h \in H$ is said to overfit the training data if there exists some alternative hypothesis $h' \in H$, such that $h$ has smaller error than h' over the training examples, but h' has a smaller error than h over the entire distribution of instances. 

![[Pasted image 20230203190549.png]]

In the image above, we see that the tree begins to decrease its accurate despite increasing its accuracy on the training examples.

Random noise can lead to overfitting, but overfitting can occur even when the training data is noise-free.

There are several approaches to avoid overfitting, but they can generally be grouped into two classes:
- approaches that stop growing the tree earlier, before it reaches the point where it perfectly classifies the training data
	- approaches that allow the tree to overfit the data, and then post-prune the tree 

page 81 (page 69 in the textbook)