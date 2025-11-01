import jsPDF from 'jspdf';
import 'jspdf-autotable';

export const generateMARPOLPDF = (formData) => {
  const doc = new jsPDF();
  
  // Header - ENA WASTE MANAGEMENT LTD.
  doc.setFontSize(16);
  doc.setTextColor(40, 40, 40);
  doc.text('ENA WASTE MANAGEMENT LTD.', 105, 15, { align: 'center' });
  doc.setFontSize(10);
  doc.text('Tema Kpone Car Park • P.O. BOX GP 4369, Accra', 105, 22, { align: 'center' });
  doc.text('Tel: 0244316155, 024272684, 0558674185', 105, 27, { align: 'center' });
  
  // Title
  doc.setFontSize(14);
  doc.text('SHIP WASTE COLLECTION FORM', 105, 40, { align: 'center' });
  doc.setFontSize(10);
  doc.text('UNDER REGULATIONS OF MARPOL 73/78 AND GHANA PORTS AND HARBOURS AUTHORITY DECLARATION', 105, 47, { align: 'center' });
  
  let yPosition = 60;
  
  // I. SHIP PARTICULARS
  doc.setFontSize(12);
  doc.text('I. SHIP PARTICULARS', 14, yPosition);
  yPosition += 10;
  
  const shipData = [
    ['Name of Ship:', formData.shipName || ''],
    ['IMO Number:', formData.imoNumber || ''],
    ['Gross Tonnage:', formData.grossTonnage || ''],
    ['Owner or Operator:', formData.ownerOperator || ''],
    ['Distinctive Number:', formData.distinctiveNumber || ''],
    ['Flag State:', formData.flagState || ''],
    ['Type of Ship:', formData.otherShipType || formData.shipType || '']
  ];
  
  doc.autoTable({
    startY: yPosition,
    head: [['Field', 'Value']],
    body: shipData,
    theme: 'grid',
    styles: { fontSize: 10 },
    headStyles: { fillColor: [59, 130, 246] }
  });
  
  yPosition = doc.lastAutoTable.finalY + 15;
  
  // II. PORT AND VOYAGE PARTICULARS
  doc.setFontSize(12);
  doc.text('II. PORT AND VOYAGE PARTICULARS', 14, yPosition);
  yPosition += 10;
  
  const portData = [
    ['Location/Terminal:', formData.locationTerminal || ''],
    ['Arrival Date/Time:', formatDateTime(formData.arrivalDateTime)],
    ['Departure Date/Time:', formatDateTime(formData.departureDateTime)],
    ['Last Port & Country:', formData.lastPortCountry || ''],
    ['Next Port & Country:', formData.nextPortCountry || ''],
    ['Last Waste Discharge Port:', formData.lastWasteDischargePort || ''],
    ['Date of Last Discharge:', formData.lastDischargeDate || ''],
    ['Next Discharge Port:', formData.nextDischargePort || ''],
    ['Submitted By:', formData.submittingPerson || 'Master']
  ];
  
  doc.autoTable({
    startY: yPosition,
    head: [['Field', 'Value']],
    body: portData,
    theme: 'grid',
    styles: { fontSize: 9 },
    headStyles: { fillColor: [59, 130, 246] }
  });
  
  yPosition = doc.lastAutoTable.finalY + 15;
  
  // III. WASTE DISCHARGE
  doc.setFontSize(12);
  doc.text('III. TYPE AND AMOUNT OF WASTE FOR DISCHARGE TO FACILITY', 14, yPosition);
  yPosition += 10;
  
  // Deliver all waste confirmation
  doc.setFontSize(10);
  doc.text(`Delivering all waste: ${formData.deliverAllWaste ? 'YES' : 'NO'}`, 14, yPosition);
  yPosition += 8;
  
  // Add waste discharge tables for all annexes
  const wasteTables = [
    { title: 'MARPOL Annex I - Oil', data: formData.wasteAnnexI },
    { title: 'MARPOL Annex II - NLS', data: formData.wasteAnnexII },
    { title: 'MARPOL Annex IV - Sewage', data: formData.wasteAnnexIV },
    { title: 'MARPOL Annex V - Garbage', data: formData.wasteAnnexV },
    { title: 'MARPOL Annex VI - Air Pollution', data: formData.wasteAnnexVI }
  ];
  
  wasteTables.forEach((table, index) => {
    if (yPosition > 250) {
      doc.addPage();
      yPosition = 20;
    }
    
    doc.setFontSize(11);
    doc.text(table.title, 14, yPosition);
    yPosition += 8;
    
    const wasteData = Object.entries(table.data || {}).map(([key, value]) => {
      const wasteName = getWasteName(key, table.title);
      return [wasteName, value.quantity || '0.00', value.substanceName || ''];
    }).filter(row => row[1] !== '0.00');
    
    if (wasteData.length > 0) {
      const hasSubstanceNames = wasteData.some(row => row[2]);
      const headers = hasSubstanceNames 
        ? [['Waste Type', 'Quantity (m³/MT)', 'Substance Name']]
        : [['Waste Type', 'Quantity (m³/MT)']];
      
      const bodyData = hasSubstanceNames 
        ? wasteData 
        : wasteData.map(row => [row[0], row[1]]);
      
      doc.autoTable({
        startY: yPosition,
        head: headers,
        body: bodyData,
        theme: 'grid',
        styles: { fontSize: 8 },
        headStyles: { fillColor: [100, 100, 100] }
      });
      yPosition = doc.lastAutoTable.finalY + 10;
    } else {
      doc.setFontSize(9);
      doc.text('No waste recorded', 14, yPosition);
      yPosition += 15;
    }
  });
  
  // Add new page for remaining sections
  doc.addPage();
  yPosition = 20;
  
  // IV. WASTE RETAINED ON BOARD
  doc.setFontSize(12);
  doc.text('IV. WASTE RETAINED ON BOARD', 14, yPosition);
  yPosition += 10;
  
  // Add waste retained tables
  const retainedTables = [
    { title: 'MARPOL Annex I - Oil', data: formData.retainedAnnexI },
    { title: 'MARPOL Annex II - NLS', data: formData.retainedAnnexII },
    { title: 'MARPOL Annex IV - Sewage', data: formData.retainedAnnexIV },
    { title: 'MARPOL Annex V - Garbage', data: formData.retainedAnnexV }
  ];
  
  retainedTables.forEach((table, index) => {
    if (yPosition > 200) {
      doc.addPage();
      yPosition = 20;
    }
    
    doc.setFontSize(11);
    doc.text(table.title, 14, yPosition);
    yPosition += 8;
    
    const retainedData = Object.entries(table.data || {}).map(([key, value]) => {
      const wasteName = getWasteName(key, table.title);
      return [
        wasteName,
        value.maxCapacity || '0.00',
        value.amountRetained || '0.00',
        value.nextDeliveryPort || '',
        value.volumeBeforeNextPort || '0.00'
      ];
    }).filter(row => row[2] !== '0.00');
    
    if (retainedData.length > 0) {
      doc.autoTable({
        startY: yPosition,
        head: [['Waste Type', 'Max Capacity', 'Amount Retained', 'Next Port', 'Volume Before Next']],
        body: retainedData,
        theme: 'grid',
        styles: { fontSize: 7 },
        headStyles: { fillColor: [100, 100, 100] }
      });
      yPosition = doc.lastAutoTable.finalY + 10;
    } else {
      doc.setFontSize(9);
      doc.text('No waste retained', 14, yPosition);
      yPosition += 15;
    }
  });
  
  // V. REMARKS AND SIGNATURES
  if (yPosition > 200) {
    doc.addPage();
    yPosition = 20;
  }
  
  doc.setFontSize(12);
  doc.text('V. REMARKS AND SIGNATURES', 14, yPosition);
  yPosition += 10;
  
  // Remarks
  doc.setFontSize(10);
  doc.text('Remarks:', 14, yPosition);
  yPosition += 6;
  doc.setFontSize(9);
  const remarks = formData.remarks || 'No remarks';
  const splitRemarks = doc.splitTextToSize(remarks, 180);
  doc.text(splitRemarks, 14, yPosition);
  yPosition += (splitRemarks.length * 5) + 10;
  
  // Signatures - ENA Waste Management
  const signatureData = [
    ['Chief Engineer / Captain:', formData.captainSignature || '', formData.captainAgreed ? 'Certified' : 'Not Certified'],
    ['Agent:', formData.agentSignature || ''],
    ['ENA Waste Management:', formData.emaSignature || '']
  ];
  
  doc.autoTable({
    startY: yPosition,
    head: [['Role', 'Signature', 'Status']],
    body: signatureData,
    theme: 'grid',
    styles: { fontSize: 10 },
    headStyles: { fillColor: [59, 130, 246] }
  });
  
  // Footer note
  const finalY = doc.lastAutoTable.finalY + 10;
  doc.setFontSize(8);
  doc.setTextColor(100, 100, 100);
  doc.text('NB: ZERO WASTE WILL NOT BE RESPONSIBLE FOR ANY UNDISCLOSED HAZARDOUS WASTE', 105, finalY, { align: 'center' });
  
  // Save the PDF
  const fileName = `MARPOL-Form-${formData.shipName || 'UnknownShip'}-${new Date().toISOString().split('T')[0]}.pdf`;
  doc.save(fileName);
};

// Helper function to get waste names
const getWasteName = (key, category) => {
  const wasteNames = {
    // Annex I
    'oilyBilgeWater': 'Oily Bilge Water',
    'oilyResidues': 'Oily Residues (Sludge)',
    'oilyTankWashing': 'Oily Tank Washing',
    'dirtyBallastWater': 'Dirty Ballast Water',
    'scaleSludge': 'Scale and Sludge',
    'otherAnnexI': 'Other',
    
    // Annex II
    'categoryX': 'Category X Substance',
    'categoryY': 'Category Y Substance',
    'categoryZ': 'Category Z Substance',
    'osSubstances': 'OS - Other Substances',
    
    // Annex IV
    'sewage': 'Sewage',
    
    // Annex V
    'plastics': 'A. Plastics',
    'foodWaste': 'B. Food Waste',
    'domesticWaste': 'C. Domestic Waste',
    'cookingOil': 'D. Cooking Oil',
    'incineratorAsh': 'E. Incinerator Ash',
    'operationalWaste': 'F. Operational Wastes',
    'cargoResidues': 'G. Cargo Residues',
    'animalCarcasses': 'H. Animal Carcass(es)',
    'eWaste': 'I. E-Waste',
    
    // Annex VI
    'ozoneDepleting': 'Ozone-depleting Substances',
    'exhaustResidues': 'Exhaust Gas Cleaning Residues'
  };
  
  return wasteNames[key] || key;
};

// Helper function to format date/time
const formatDateTime = (dateTimeString) => {
  if (!dateTimeString) return '';
  try {
    const date = new Date(dateTimeString);
    return date.toLocaleString();
  } catch (error) {
    return dateTimeString;
  }
};

export default generateMARPOLPDF;
