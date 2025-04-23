from transformers import AutoTokenizer, AutoModel
import torch
import torch.nn.functional as F

# Cargar modelo y tokenizer
model_name = "sentence-transformers/paraphrase-MiniLM-L6-v2"
tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModel.from_pretrained(model_name)

# Función para obtener embedding de una frase
def get_embedding(text):
    encoded = tokenizer(text, return_tensors='pt', padding=True, truncation=True)
    with torch.no_grad():
        model_output = model(**encoded)
    embeddings = model_output.last_hidden_state
    attention = encoded['attention_mask'].unsqueeze(-1)
    return torch.sum(embeddings * attention, dim=1) / attention.sum(dim=1)

# Frases a comparar
frase_1 = "La IA está cambiando el mundo"
frase_2 = "La inteligencia artificial transforma la sociedad"

emb_1 = get_embedding(frase_1)
emb_2 = get_embedding(frase_2)

# Similaridad del coseno
similaridad = F.cosine_similarity(emb_1, emb_2)

print(f"🔍 Similitud entre frases: {similaridad.item():.4f}")
