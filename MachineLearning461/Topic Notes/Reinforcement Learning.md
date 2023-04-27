## Trash collector
In this example, we consider the state to be the **location** of the agent.
The actions of the agent are moving up, down, left, or right.
The reward, r=0 if not collected and r=1 if collected.

```mermaid
flowchart TD;
	A(Agent) -->|Action| B(Environment)
	B -->|Reward| A
	B -->|State| A
```

For any future rewards where r=1, we discount the value and are not valued as much. This is because there could be an infinite amount of states, or the state might never be reached.

### Markov Decision Process
- Set of states, $S$
- Set of actions, $A$
- At each time, the agent observes the state $s_t \in S$ then chooses action $a_t \in A$
- Then receives reward $r_t$ and state changes to $s_{t+1}$
- Markov assumption: $P(s_{t+1} \mid s_t, a_t, s_{t-1}, a_{t-1}) = P(s_{t+1} \mid s_t, a_t)$
- Also assume reward Markov: $P(r_t \mid s_t, a_t, s_{t-1}, a_{t-1}, \cdot\cdot\cdot) = P(r_t \mid s_t, a_t)$

We want to maximize the average of the rewards. The policy is a mapping of state to action that maximizes the reward.
$$E[r_t + \gamma r_{t+1} + \gamma^2 r_{t+2} + \cdot\cdot\cdot] \text{ for } 0 \lt \gamma \le 1$$
for every possible starting state $s_0$.

We also have $r(s, a)$, which specifies the *immediate reward* given a state and action. The control policy maximizes the summation of $r(s_t,a_t)$.