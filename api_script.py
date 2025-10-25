from google import genai

client = genai.Client()
with open("text.txt", 'r') as file:
    queries = file.readlines()
with open("results.json", "w+") as out_file:
    for query in queries:
        response = client.models.generate_content(
            model="gemini-2.5-flash",
            contents=query
        )
        out_file.write(response.text + '\n')