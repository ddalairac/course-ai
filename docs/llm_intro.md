[< Back](../README.md)

# How Does a LLM (Large Language Model) Work?

Models like GPT are text prediction engines. They analyze the input text and predict the most likely next word based on a probability distribution over the entire vocabulary. This process is repeated in a loop:

1. The model receives a text input.
2. It calculates a probability distribution over the possible next words.
3. It selects a word from that distribution (based on a parameter called *temperature*).
4. It appends the word to the text.
5. It re-evaluates the new sequence to predict the next word.




## Key Concepts

### Temperature
This parameter controls how random the word selection is:
- **Low temperature** (e.g., 0): always selects the most probable word.
- **High temperature** (e.g., 1.0): randomly selects among the most likely options, generating more diverse or creative results.

### Tokens
Any input (text, sound, image) is divided into fragments called **tokens**. In the case of text, these are usually words.

### Vectors
Each token is converted into a numerical vector: a mathematical representation of that token.
You can perform mathematical operations on vectors, such as addition, multiplication, or transformation (e.g., scaling or projection).

### Embeddings
An embedding transforms tokens into vectors placed in a high-dimensional space based on statistical meaning learned during training.
This allows for operations like:

```
woman - man + king ≈ queen
```

This happens because, during training, certain spatial directions come to represent properties like gender.

### Attention
The attention mechanism allows vectors to interact with each other and adjust their encoding based on context.
This helps resolve ambiguity, since the same word can have different meanings in different contexts.

### Multilayer Perceptron (MLP)
After the attention step, vectors pass through a perceptron network (dense layers).
These layers introduce non-linear transformations that help detect complex patterns.

### Deep Learning
The repetition of the cycle **attention → MLP → normalization → residual connection** forms the core of deep learning.
For instance, GPT-3 has 96 such layers.

### Model Training
During training, the model tries to predict the next word in a sequence.
But since the correct word is already known, a technique called **causal masking** is used to prevent the model from seeing future words.
This forces the model to learn contextual dependencies using only previous information.

### Scaling and Dimensional Efficiency
This approach scales to large contexts. To make it more efficient, the **value vector** is projected to fewer dimensions and then restored to its original dimensionality later in the process.

### Parameters
Large models have millions or even billions of parameters that are tuned during training.
These parameters determine how the model responds to any given input.

### Cost (Loss Function)
The model also evaluates how good its prediction was using a **loss function**.
Training aims to minimize this loss to improve future predictions.



## Multidimensional Spaces

Although models operate in hundreds or thousands of dimensions, they're often visualized in 3D for simplicity:
- **X and Y axes**: vector values
- **Z axis**: cost or error value

The goal of training is to find the lowest-cost path across this "surface."




## Core Matrices: Query, Key, and Value

In each attention step, three matrices are calculated:

- **Query**: represents what a word “wants to know.”
- **Key**: represents potentially relevant words.
- **Value**: contains the information to be passed along if relevance is high.

A **dot product** is calculated between each query and key to obtain a measure of similarity:

- **Positive**: vectors aligned → high relationship
- **Zero**: vectors perpendicular → no relation
- **Negative**: vectors opposed → contradictory meanings

### Query
It's as if each word is asking a question.
This results in a query vector, usually in fewer dimensions.
For example, if the embedding space has 12,000 dimensions, the query might be 64 or 128.
The model evaluates each word until it finds a noun, then looks at nearby adjectives.

### Key
The relevant words, such as the adjectives that modify the noun (query).

### Value
Represents the direction or transformation between two meanings.




## Similarity

To evaluate similarity between vectors, metrics like **Euclidean distance** (how far apart they are) or **cosine similarity** (how aligned their directions are) are used.
Cosine similarity is particularly useful in embeddings because it focuses on vector orientation, not magnitude.

- **Cosine Similarity**: Measures the angle between vectors
- **Euclidean Distance**: Measures the straight-line distance between them




## Weight

The dot product result becomes an **attention weight**, indicating how relevant one word is to another.

### Dot Product
It evaluates the **direction** of vectors to identify those that are closely related:

- Positive → aligned
- Zero → orthogonal
- Negative → opposing

### Softmax
The softmax function normalizes these weights to values between 0 and 1, ensuring they sum to 1.


## Transformer

The **Transformer** is the core architecture behind models like GPT, BERT, and many other modern language models. It was introduced in the paper *“Attention is All You Need”* (Vaswani et al., 2017) and revolutionized natural language processing due to its efficiency and ability to capture complex word relationships without processing sequences in order.

### Key Characteristics

- **Parallel Processing**: Unlike RNNs or LSTMs that process text token by token sequentially, transformers process all tokens **simultaneously**, allowing for greater speed and scalability.

- **Attention as the Core**: The fundamental component is the **attention mechanism** (especially *self-attention*), which enables each word in a sequence to pay attention to all others and weigh their relevance.

- **No Recurrence**: Transformers do **not** use recurrent structures like RNNs. Instead, they rely entirely on attention layers and dense networks to model context.

- **Modular Structure**: A transformer is built from many layers or "blocks" that include:
  - Multi-head attention
  - Residual connections
  - Layer normalization
  - Perceptron networks (MLP) between blocks

### How a Transformer Layer Works

1. **Input embeddings + positional encoding**
2. → go through a **self-attention** layer
3. → followed by a **feedforward MLP**
4. → both steps include **residual connections** and **layer normalization**
5. → this structure is repeated many times (e.g., 96 times in GPT-3)

---

## GPT

**GPT** stands for **Generative Pre-trained Transformer**.

### Generative
The model **generates** text. It doesn't just classify or summarize—it can produce new, original text from scratch.

### Pre-trained
Before being used for specific tasks, GPT is trained on massive volumes of text (books, articles, websites). This **pre-training** gives it a broad understanding of language. It can then be **fine-tuned** for particular applications.

### Transformer
GPT is built on the Transformer architecture, relying heavily on attention to process and understand context efficiently.

---

## BERT

**BERT** stands for **Bidirectional Encoder Representations from Transformers**. Introduced by Google in 2018, BERT changed NLP by introducing **bidirectional context understanding**—the ability to understand the meaning of a word based on both the left and right sides of a sentence.

### How BERT Works

Unlike GPT, which generates text token by token in sequence, **BERT does not generate text**—it **understands** it. It is designed for tasks like classification, question answering, sentiment analysis, etc.

### Architecture
- BERT **only uses the encoder** part of the Transformer (whereas GPT uses the decoder).
- Each token **attends to all others** using **bidirectional self-attention**.
- This means BERT sees both **left and right context simultaneously**, which is crucial for full-sentence understanding.

---

## Comparison: BERT vs GPT

| Feature                  | BERT                             | GPT                                |
|--------------------------|----------------------------------|-------------------------------------|
| Direction                | Bidirectional                    | Unidirectional (left to right)      |
| Primary Use              | Understanding                    | Generation                          |
| Transformer Component    | Encoder                          | Decoder                             |
| Training Technique       | MLM + NSP                        | Causal Language Modeling            |
