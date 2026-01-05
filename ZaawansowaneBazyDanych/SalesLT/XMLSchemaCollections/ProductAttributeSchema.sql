CREATE XML SCHEMA COLLECTION [SalesLT].[ProductAttributeSchema]
    AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <xsd:element name="ProductAttributes">
    <xsd:complexType>
      <xsd:complexContent>
        <xsd:restriction base="xsd:anyType">
          <xsd:sequence>
            <xsd:element name="Material" type="xsd:string" minOccurs="0" />
            <xsd:element name="WarrantyPeriod" type="xsd:string" minOccurs="0" />
            <xsd:element name="Manufacturer" type="xsd:string" minOccurs="0" />
            <xsd:element name="Usage" type="xsd:string" minOccurs="0" />
            <xsd:element name="EnergyClass" type="xsd:string" minOccurs="0" />
          </xsd:sequence>
        </xsd:restriction>
      </xsd:complexContent>
    </xsd:complexType>
  </xsd:element>
</xsd:schema>';

