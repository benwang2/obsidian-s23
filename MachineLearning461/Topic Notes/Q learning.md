Instead of using the value function V(s) for reinforcement learnin,g we use the action-value function Q(s,a), where

$$V^\pi(s) = E(G | S_t=s)$$
$$Q^\pi(s,a) = E(G | S_t =s, A_t=a)$$
where $G$ is the expected return starting from state $s$.

Optimally, we have the equations as given:

$$Q^\pi(s,a) = R(s,a) + \gamma \sum_{s' \in S} P_{sa}(s')Q^\pi(s',\pi(s'))$$
$$Q*(s,a)=R(s,a)+\gamma \sum_{s' \in S}P_{sa}(s')\underset{s'\in S}{\text{max}}Q^*(s',a')$$

Every time we observe a next state, we calculate the Bellman error using:
$$R(s,a)+\gamma \underset{a' \in A}{\text{max}}Q(s',a')-Q(s,a)$$
In this case, bellman error is the difference between the estimated Q-value and the target Q-value.

The target Q-value is calculated using the Bellman equation and represents the expected reward for taking the best action in the next state.