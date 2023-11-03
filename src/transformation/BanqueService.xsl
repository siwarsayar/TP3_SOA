<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head></head>
			<body>
				<!-- Crée un tableau pour afficher les informations sur les comptes bancaires -->
				<table border="1">
					<tr>
						<th>Code</th>
						<th>Solde</th>
						<th>Date de création</th>
					</tr>
					<!-- Parcourt tous les éléments "getComptes" dans le document XML -->
					<xsl:for-each select="BanqueService/getComptes">
						<tr>
							<!-- Affiche le code du compte -->
							<td><xsl:value-of select="@code" /></td>
							<!-- Affiche le solde du compte -->
							<td><xsl:value-of select="@solde" /></td>
							<!-- Affiche la date de création du compte -->
							<td><xsl:value-of select="@date"/></td>
						</tr>
					</xsl:for-each>
				</table>
				<!-- Calcule la somme totale des soldes de tous les comptes -->
				<xsl:variable name="totalSolde" select="sum(BanqueService/getComptes/@solde)"/>
				<!-- Affiche le total des soldes -->
				<p>Total des soldes : <xsl:value-of select="$totalSolde" /></p>
				<!-- Affiche le titre "get comptes >2000" -->
				<h1>get comptes >2000</h1>
				<!-- Crée un tableau pour afficher les informations sur les comptes créés après l'année 2000 -->
				<table border="1">
					<tr>
						<th>Code</th>
						<th>Solde</th>
						<th>Date de création</th>
					</tr>
					<!-- Parcourt les éléments "getComptes" avec une date de création après 2000 -->
					<xsl:for-each select="BanqueService/getComptes[substring(@date,1,4) > 2000]">
						<tr>
							<!-- Affiche le code du compte -->
							<td><xsl:value-of select="@code" /></td>
							<!-- Affiche le solde du compte -->
							<td><xsl:value-of select="@solde" /></td>
							<!-- Affiche la date de création du compte -->
							<td><xsl:value-of select="@date"/></td>
						</tr>
					</xsl:for-each>
				</table>
				<!-- Calcule la somme totale des soldes des comptes créés après 2000 -->
				<xsl:variable name="totalSoldeFiltré" select="sum(/BanqueService/getComptes[substring(@date,1,4) > 2000]/@solde)" />
				<!-- Affiche le total des soldes des comptes filtrés -->
				<p>Total des soldes Filtrés : <xsl:value-of select="$totalSoldeFiltré" /></p>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>