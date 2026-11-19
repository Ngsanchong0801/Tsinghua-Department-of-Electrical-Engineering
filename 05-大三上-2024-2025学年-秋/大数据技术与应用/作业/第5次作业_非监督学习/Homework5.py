import pandas as pd
from sklearn.decomposition import PCA
from sklearn.manifold import TSNE
from sklearn.cluster import KMeans
from sklearn.metrics import adjusted_rand_score, silhouette_score
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler

# 读取数据
data = pd.read_csv("hw5_data.csv")

# 选择特征，去除标签列
X = data.drop(columns=['SSSA'])
y_true = data['SSSA']  # 原始SSSA标签

# 对数据进行标准化
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

### 1. 使用 PCA + KMeans ###
# 使用PCA进行降维
pca = PCA(n_components=2)
X_pca = pca.fit_transform(X_scaled)

# 使用K-means聚类算法（PCA降维后）
kmeans_pca = KMeans(n_clusters=2, init='k-means++', n_init=10, random_state=42)
kmeans_labels_pca = kmeans_pca.fit_predict(X_scaled)

# 评估 PCA + KMeans 聚类结果
ari_pca = adjusted_rand_score(y_true, kmeans_labels_pca)
silhouette_pca = silhouette_score(X_pca, kmeans_labels_pca)
print(f"[PCA + KMeans] 调整兰德指数 (ARI): {ari_pca}")
print(f"[PCA + KMeans] 轮廓系数 (Silhouette Score): {silhouette_pca}")

# 可视化PCA结果与K-means聚类标签
plt.figure(figsize=(8, 6))
plt.scatter(X_pca[:, 0], X_pca[:, 1], c=kmeans_labels_pca, cmap='viridis')
plt.title("PCA + KMeans Clustering Results (with K-means++)")
plt.xlabel("PCA Component 1")
plt.ylabel("PCA Component 2")
plt.colorbar(label='Cluster')
plt.text(min(X_pca[:, 0]), min(X_pca[:, 1]),
         f"ARI: {ari_pca:.5f}\nSilhouette: {silhouette_pca:.5f}", fontsize=12, bbox=dict(facecolor='white', alpha=0.6))
plt.show()

# 可视化PCA结果与真实SSSA标签
plt.figure(figsize=(8, 6))
plt.scatter(X_pca[:, 0], X_pca[:, 1], c=y_true, cmap='viridis')
plt.title("PCA + True SSSA Labels")
plt.xlabel("PCA Component 1")
plt.ylabel("PCA Component 2")
plt.colorbar(label='SSSA Label')
plt.show()

### 2. 使用 t-SNE + KMeans ###
# 使用t-SNE进行降维
tsne = TSNE(n_components=2, perplexity=50, learning_rate=200, random_state=42)
X_tsne = tsne.fit_transform(X_scaled)

# 使用K-means聚类算法（t-SNE降维后）
kmeans_tsne = KMeans(n_clusters=2, init='k-means++', n_init=20, random_state=42)
kmeans_labels_tsne = kmeans_tsne.fit_predict(X_tsne)

# 评估 t-SNE + KMeans 聚类结果
ari_tsne = adjusted_rand_score(y_true, kmeans_labels_tsne)
silhouette_tsne = silhouette_score(X_tsne, kmeans_labels_tsne)
print(f"[t-SNE + KMeans] 调整兰德指数 (ARI): {ari_tsne}")
print(f"[t-SNE + KMeans] 轮廓系数 (Silhouette Score): {silhouette_tsne}")

# 可视化t-SNE结果与K-means聚类标签
plt.figure(figsize=(8, 6))
plt.scatter(X_tsne[:, 0], X_tsne[:, 1], c=kmeans_labels_tsne, cmap='viridis')
plt.title("t-SNE + KMeans Clustering Results")
plt.xlabel("t-SNE Component 1")
plt.ylabel("t-SNE Component 2")
plt.colorbar(label='Cluster')
plt.text(min(X_tsne[:, 0]), min(X_tsne[:, 1]),
         f"ARI: {ari_tsne:.5f}\nSilhouette: {silhouette_tsne:.5f}", fontsize=12, bbox=dict(facecolor='white', alpha=0.6))
plt.show()

# 可视化t-SNE结果与真实SSSA标签
plt.figure(figsize=(8, 6))
plt.scatter(X_tsne[:, 0], X_tsne[:, 1], c=y_true, cmap='viridis')
plt.title("t-SNE + True SSSA Labels")
plt.xlabel("t-SNE Component 1")
plt.ylabel("t-SNE Component 2")
plt.colorbar(label='SSSA Label')
plt.show()
